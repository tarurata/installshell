#!/bin/bash
# Creating superuser and add to a super user list(wheel group).
useradd testuser
passwd testuser

# Allows people in group wheel to run all commands
# edit /etc/sudoers
sed -i "s/# %wheel	ALL=(ALL)	ALL/%wheel	ALL=(ALL)	ALL/g" /etc/sudoers

usermod -aG wheel testuser
