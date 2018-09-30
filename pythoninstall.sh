#!/bin/bash

# install required packages
yum install make
yum install gcc
yum install zlib-devel
yum install bzip2-devel
yum install openssl-devel
yum install ncurses-devel
yum install sqlite-devel
yum install readline-devel
yum install tk-devel

cd /usr/local/src
wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz
tar xvzf Python-3.6.3.tgz
cd Python-3.6.3

./configure --prefix=/usr/local/python
make
make install

# Create path in .bash_profile 
export PATH=$PATH:/usr/local/python/bin >> ~/.bash_profile

# Create symbolic link.
ln -s /usr/local/python/bin/python3 /usr/local/bin/python
ln -s /usr/local/python/bin/pip3.6 /usr/local/bin/pip

# Version check
python --version
pip --version
