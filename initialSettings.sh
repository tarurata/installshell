#!/bin/bash

set -eu

if [ "$(uname)" = "Linux" ]; then
  sudo apt-get update
  sudo apt-get upgrade
  # xsel is for tmux copy paste.
  # vim-gtk3 is for vim clipboard.
  sudo apt-get install -y vim git wget curl tmux xsel ibus-mozc xclip vim-gtk3
elif [ "$(uname)" = "Darwin" ]; then
  sudo brew install -y vim git wget curl tmux xsel
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

wget https://raw.githubusercontent.com/tarurata/config/master/.tmux.conf -P "${HOME}"

vim -c PlugInstall -c q -c q
