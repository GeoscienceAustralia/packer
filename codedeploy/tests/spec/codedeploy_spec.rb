require 'spec_helper'

describe package('codedeploy-agent') do
  it { should be_installed }
end
