#!/bin/bash

# Settings for development.

# if [[ "${UID}" -ne 0 ]]
# then
# 	echo 'Please execute as root user.'
# 	exit 1
# fi

## Update all (installed?) yum repositories.
# yum update -y

## General packages installation
sudo yum install wireshark git vim -y

## Set SElinux disabled permanently for development. 
read -p 'Do you want to SElinux to be permissive permanently?(y/n)' YESNO
if [[ "${YESNO}" = 'y' ]]
then
	setenforce 0
	sed -i "s/\(^SELINUX=\).*/\1disabled/" /etc/selinux/config
else
	echo 'Did not do anything about SElinux'
fi

## .vimrc configuration.

if [[ ! -e ~/.vimrc ]]
then
	touch ~/.vimrc
	echo "set number" >> ~/.vimrc
	echo "color slate" >> ~/.vimrc
	echo "set shiftwidth=4" >> ~/.vimrc
	echo "set tabstop=4" >> ~/.vimrc
	echo "inoremap <silent> jk <ESC>" >> ~/.vimrc
	echo "inoremap <silent> kj <ESC>" >> ~/.vimrc
	echo "set smartindent" >> ~/.vimrc
	echo "Vimrc file has been created at ${HOME} directory"
else
	echo '.vimrc file is already existed. Nothing to do.'
fi 


## Git Setting
read -p 'Set git email(test@test.com)and username(tarurata) (y/n)?' SET_GITSTATUS

if [[ "${SET_GITSTATUS}" = 'y' ]]
then
	git config --global user.email "test@test.com"
	git config --global user.name "tarurata"
fi
