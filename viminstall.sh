#!/bin/bash
# set -e

if [ uname -eq "Linux" ]; then
  sudo apt-get install -y vim git wget curl
elif [ uname -eq "Darwin" ]; then
  sudo brew install -y vim git wget curl
fi
    
# Get neccessary files and dirs for plugin.
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
if [ uname -eq "Linux" ]; then
  wget https://raw.githubusercontent.com/tarurata/config/master/.vimrc-linux -P "${HOME}" -O ".vimrc"
elif [ uname -eq "Darwin" ]; then
  wget https://raw.githubusercontent.com/tarurata/config/master/.vimrc-forMac -P "${HOME}" -O ".vimrc"
fi

vim +PlugInstall
