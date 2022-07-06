control 'webmin' do
  impact 0.7
  title 'Webmin installed'
  desc 'Ensure Webmin is installed'
  describe package('webmin') do
    it { should be_installed }
    its('version') { should cmp '1.984' }
  end
  describe port(10000) do
    it { should be_listening }
  end
  describe file('/etc/webmin/miniserv.conf') do
    it { should exist }
    its('content') { should match(%r{allow=10.128.1.0/24 LOCAL}) }
  end
  describe service('webmin') do
    it { should be_enabled }
    it { should be_running }
  end
end

