#!/bin/bash
# set -e         

# Linux
sudo apt-get install -y vim git wget curl
# Mac
## sudo brew install -y vim git wget curl
  
# Get neccessary files and dirs for plugin.
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
# Linux
wget https://raw.githubusercontent.com/tarurata/config/master/.vimrc-linux -P "${HOME}" -O ".vimrc"
# Mac
## wget https://raw.githubusercontent.com/tarurata/config/master/.vimrc-forMac -P "${HOME}" -O ".vimrc"

vim +PlugInstall
