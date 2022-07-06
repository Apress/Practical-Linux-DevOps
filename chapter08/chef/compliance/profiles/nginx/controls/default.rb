control 'nginx-config' do 
  impact 0.7
  title 'Nginx configuration'
  desc 'Nginx configuration'
  describe port(80) do
    it { should_not be_listening }
  end
  describe port(443) do
    it { should be_listening }
  end
  describe package('nginx') do
    it { should be_installed }
  end
  describe http('https://localhost:443/', ssl_verify: false) do 
    its('status') { should cmp 200 }
    its('body') { should match /Nginx Site Created by Chef/ }
  end
end

control 'nginx-security' do
  impact 1.0
  title 'Nginx TLS security'
  desc 'Do not support TLSv1.1'
  describe ssl(port: 443).protocols('tls1.1') do
    it { should_not be_enabled }
  end
  describe ssl(port: 443).protocols('tls1.2') do
    it { should be_enabled }
  end
end

