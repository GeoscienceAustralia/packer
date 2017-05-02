#!/bin/bash

# Install dependencies
sudo apt-get install -y --force-yes ruby2.3 ruby2.3-dev
sudo gem install bundler
cd /tmp/tests
bundle install

# Run tests
bundle exec rake spec