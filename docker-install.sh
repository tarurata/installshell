#!/bin/bash

# Install docker (which is suited for your environment)
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
adduser testuser

# Add tesetuser to docker group
usermod -aG docker testuser
docker version

# Add testuser to sudoers
su - testuser
searchQuery="root	ALL=(ALL) 	ALL"
appendParam="testuser	ALL=(ALL) 	ALL"
sed -i "/${searchQuery}/a ${appendParam}" /etc/sudoers

# Install docker-machine
base=https://github.com/docker/machine/releases/download/v0.16.0 &&   curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&   sudo install /tmp/docker-machine /usr/local/bin/docker-machine
docker-machine version

# Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

