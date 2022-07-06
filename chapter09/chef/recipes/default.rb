# Cookbook:: webmin
# Recipe:: default
#
# Copyright:: 2022, John Adams
#
if platform?('ubuntu')
  
  %w(perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python unzip).each do |pkg|
    package pkg do
      action :install
    end
  end

  remote_file '/root/webmin_1.984.deb' do
    source 'http://prdownloads.sourceforge.net/webadmin/webmin_1.984_all.deb'
    owner 'root'
    group 'root'
    mode '0755'
    action :create_if_missing
  end

  dpkg_package 'webin' do
    source '/root/webmin_1.984.deb'
    action :install
  end

  bash 'append-trusted-ips' do
    user 'root'
    code <<-EOF
      echo "allow=10.128.1.0/24 LOCAL" >> /etc/webmin/miniserv.conf
    EOF
    notifies :restart, 'service[webmin]', :immediately
    not_if 'grep -q "allow=10.128.1.0/24 LOCAL" /etc/webmin/miniserv.conf'
  end

  service 'webmin' do
    supports status: true
    action [:enable, :restart]
  end
end

