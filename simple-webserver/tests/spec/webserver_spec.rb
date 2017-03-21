require 'spec_helper'

describe package('apache2') do
  it { should be_installed }
end

describe command('sudo service apache2 status') do
  its(:stdout) { should match /running/ }
end

describe command('sudo fail2ban-client status') do 
  its(:stdout) { should match /apache-auth/}
  its(:stdout) { should match /apache-badbots/}
  its(:stdout) { should match /apache-botsearch/}
  its(:stdout) { should match /apache-fakegooglebot/}
  its(:stdout) { should match /apache-modsecurity/}
  its(:stdout) { should match /apache-nohome/}
  its(:stdout) { should match /apache-noscript/}
  its(:stdout) { should match /apache-overflows/}
  its(:stdout) { should match /apache-shellshock/}
  its(:stdout) { should match /sshd/}
end

describe command('sudo ufw status verbose') do
  its(:stdout) { should match /22 +ALLOW IN/}
  its(:stdout) { should match /80\/tcp \(Apache\) +ALLOW IN/}
end

describe command('sudo cat /etc/fstab') do
  its(:stdout) { should match /tmpfs +\/run\/shm +tmpfs +defaults,noexec,nosuid +0 +0/}
end