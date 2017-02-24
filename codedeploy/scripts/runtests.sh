#!/bin/bash

# Install dependencies
sudo yum install -y gcc ruby-devel rubygems rake
sudo gem install bundler --no-ri --no-rdoc
gem install io-console --no-ri --no-rdoc
export BUNDLE_DISABLE_SHARED_GEMS=0


cd /tmp/tests
bundle install
bundle update

# Run tests
bundle exec rake spec