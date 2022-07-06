# Cookbook:: nginx
# Recipe:: webserver
package 'nginx' 
package 'curl'

directory '/etc/nginx/ssl' do 
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

openssl_x509_certificate '/etc/nginx/ssl/mycert.pem' do
  common_name 'node[:fqdn]'
  org 'Chef'
  org_unit 'Lab'
  country 'US'
  mode '0600'
end

template '/etc/nginx/nginx.conf' do 
  source 'nginx.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[nginx]', :delayed
  action :create
end

template '/etc/nginx/sites-available/default' do
  source 'server.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[nginx]', :delayed
  action :create
end

template '/var/www/html/index.html' do
  source 'index.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

service 'nginx' do 
  action [:enable, :start]
end

service 'nginx' do
  subscribes :reload, 'file[/etc/nginx/ssl/mycert.pem]', :immediately
end

