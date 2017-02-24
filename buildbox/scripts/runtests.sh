#!/bin/bash

# Install dependencies
cd /tmp/tests
bundle install

# Run tests
bundle exec rake spec