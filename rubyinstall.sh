#!/bin/bash

# if [[ "${UID}" != 0 ]]
# then
# 	echo 'Please execute as root user.'
# 	exit 1
# elif [[ "${0}" = su ]]
# then 
# 	echo 'Please login as root user and execute.'
# 	exit 1
# fi

### Install packages which are neccessary for ruby instllation.
sudo yum install -y git gcc openssl-devel readline-devel zlib-devel sqlite-devel gcc-c++ libicu-devel cmake vim bzip2

### Get rbenv plugin from github.
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
if [[ "${?}" = 1 ]]
then
	echo 'Please install git with "yum install git -y"'
	exit 1
fi

### Install rbenv ####

# Check if PATH is already existed.
grep 'export PATH="$HOME/.rbenv/bin:$PATH"' -rlo ~/.bash_profile
if [[ "${?}" = 1 ]]
then
# Make the PATH to .rbenv 
# Everytime bash is booted initialize rbenv.
# Adapt the change promptly with source command.
	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
	echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

else
	echo 'PATH is already existed and just omitted making PATH'

fi

source ~/.bash_profile
rbenv --version

### Install ruby

# To install ruby, get ruby-built plugin from github.
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install ruby 
rbenv install 2.4.2
# Decide which version to use for global(whole this centos)
rbenv global 2.4.2
# Adapt the version
rbenv rehash
ruby -v

### Install ruby bundler
gem install bundler
rbenv rehash
bundle -v



