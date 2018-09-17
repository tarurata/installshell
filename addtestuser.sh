#!/bin/bash
# Creating superuser and add to a super user list(wheel group).
useradd testuser
passwd testuser

# Allows people in group wheel to run all commands
# edit /etc/sudoers
# %wheel ALL(=ALL) NOPASSWD: ALL              comment out off. conditional. later...

usermod -aG wheel testuser
