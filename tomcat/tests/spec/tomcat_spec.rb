require 'spec_helper'

describe package('tomcat8') do
  it { should be_installed }
end

describe command('sudo service tomcat8 status') do
  its(:stdout) { should match /running/ }
end

describe command('sudo ufw status verbose') do
  its(:stdout) { should match /22 +ALLOW IN/}
  its(:stdout) { should match /8080 +ALLOW IN/}
  its(:stdout) { should match /8005 +DENY IN/}
end

describe command('sudo cat /etc/fstab') do
  its(:stdout) { should match /tmpfs +\/run\/shm +tmpfs +defaults,noexec,nosuid +0 +0/}
end