#!/bin/bash

# Settings for development.


## Update all (installed?) yum repositories.
yum update

## Set SElinux disabled permanently for development. 
sed -i "s/\(^SELINUX=\).*/\1disabled/" /etc/selinux/config

## Vim installation( and .vimrc configuration.)
yum install -y vim

touch ~/.vimrc
echo "set number" >> ~/.vimrc
echo "color slate" >> ~/.vimrc
echo "set shiftwidth=4" >> ~/.vimrc
echo "set tabstop=4" >> ~/.vimrc
echo "inoremap <silent> jk <ESC>" >> ~/.vimrc
echo "inoremap <silent> kj <ESC>" >> ~/.vimrc

## Wireshark installation
yum install wireshark -y

## Git installation
yum install git -y
