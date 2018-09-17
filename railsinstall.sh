#!/bin/bash

# make install directory
INSTALL_DIR='~/app/ror/sample1/'
mkdir -p "${INSTALL_DIR}"

# Initialize bundle 
bundle init

# Remove # at "rails" from Gemfile
sed -i 's/# gem "rails"/gem "rails", "~> 5.1.0"/g' "${INSTALL_DIR}Gemfile"

# Install gem 
# vender -> usually put 3rd party library.
bundle install --path vendor/bundler

bundle exec rails new "${INSTALL_DIR}"

sed -i "s/# gem 'therubyracer'/gem 'therubyracer'/g" "${INSTALL_DIR}Gemfile"

bundle install
