require 'spec_helper'

describe package('awscli') do
  it { should be_installed }
end

describe command('terraform version') do
  its(:stdout) { should match /Terraform v/ }
end

describe command('terragrunt -v') do
  its(:stdout) { should match /terragrunt version v/ }
end

describe command('packer version') do
  its(:stdout) { should match /Packer v/ }
end