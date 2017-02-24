require 'spec_helper'

describe package('apache2') do
  it { should be_installed }
end

describe command('sudo service apache2 status') do
  its(:stdout) { should match /running/ }
end