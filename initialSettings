#!/bin/bash

set -eu

if [ "$(uname)" = "Linux" ]; then
  sudo apt-get install -y vim git wget curl
elif [ "$(uname)" = "Darwin" ]; then
  sudo brew install -y vim git wget curl
fi

# Get neccessary files and dirs for plugin.
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ "$(uname)" = "Linux" ]; then
  wget https://raw.githubusercontent.com/tarurata/config/master/.bashrc-linux -P "${HOME}" -O ".bashrc"
  wget https://raw.githubusercontent.com/tarurata/config/master/.vimrc-linux -P "${HOME}" -O ".vimrc"
elif [ "$(uname)" = "Darwin" ]; then
  wget https://raw.githubusercontent.com/tarurata/config/master/.bashrc-forMac -P "${HOME}" -O ".bashrc"
  wget https://raw.githubusercontent.com/tarurata/config/master/.vimrc-forMac -P "${HOME}" -O ".vimrc"
fi

vim -c PlugInstall -c q -c q
