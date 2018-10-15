#!/bin/bash

# make install directory
INSTALL_DIR='${HOME}/app/ror/sample1/'
mkdir -p "${INSTALL_DIR}"
cd "${INSTALL_DIR}"

# Initialize bundle 
bundle init

# Remove # at "rails" from Gemfile
sed -i 's/# gem "rails"/gem "rails", "~> 5.1.0"/g' "${INSTALL_DIR}Gemfile"

# Install gem 
# vender -> usually put 3rd party library.
# vendor/bundlerは絶対パス必要かも・・要確認
bundle install --path vendor/bundler

bundle exec rails new "${INSTALL_DIR}"

sed -i "s/# gem 'therubyracer'/gem 'therubyracer'/g" "${INSTALL_DIR}Gemfile"

bundle install
