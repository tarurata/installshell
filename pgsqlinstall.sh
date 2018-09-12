#!/bin/bash

yum install postgresql-server -y

# Initialize DB
postgresql-setup initdb

# Enable to be connected from any ip.(Should be changed to limited ip later)
echo "host all all 0.0.0.0 trust" >> /var/lib/pgsql/data/pg_hba.conf

# Listen any IP addresses
# sed -i "s/\(^SELINUX=\).*/\1disabled/" /etc/selinux/config
sed -e "s/\(^#listen_addresses = \).*/\1*/" /var/lib/pgsql/data/postgresql.conf
sed -e "s/#listen_addresses/listen_addresses/" /var/lib/pgsql/data/postgresql.conf

# Reboot
sudo systemctl start postgresql
sudo systemctl enable postgresql

