#!/bin/bash
# set -e         

sudo yum install -y vim git wget
  
# Get neccessary files and dirs for plugin.
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
# Linux
## wget https://raw.githubusercontent.com/tarurata/config/master/.vimrc-linux -P "${HOME}" -O ".vimrc"
# Mac
## wget https://raw.githubusercontent.com/tarurata/config/master/.vimrc-forMac -P "${HOME}" -O ".vimrc"

vim +PlugInstall
