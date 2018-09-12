#!/bin/bash

#Execute as root
#Give permission to myself with "chmod 777 nginxinstall.sh"

nginxrepo=/etc/yum.repos.d/nginx.repo

# Make Repository if there is no repository file for yum

if [ ! -e $nginxrepo ]; then 
	touch $nginxrepo
	echo "[nginx]" >> $nginxrepo
	echo "name=nginx repo" >> $nginxrepo
	echo "baseurl=http://nginx.org/packages/centos/7/\$basearch/" >> $nginxrepo
	echo "gpgcheck=0" >> $nginxrepo
	echo "enabled=1" >> $nginxrepo
fi

# Install nginx if there is no nginx.conf 

if [ ! -e /etc/nginx/nginx.conf ]; then
	yum install nginx -y
	nginx -version
	cat ./nginx.conf > /etc/nginx/nginx.conf
fi

# Settings for Firewall. Add "http" to the service list.
# Open tcp/5000 ports for now.

if [ -n "firewall-cmd --list-all | grep http" ]; then
	firewall-cmd --add-service=http --zone=public --permanent	
fi
if [ -n "firewall-cmd --list-ports --zone=public | grep 'tcp/5000'" ]; then
	firewall-cmd --add-port=5000/tcp --zone=public --permanent
fi 

firewall-cmd --reload
