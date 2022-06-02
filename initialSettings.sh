#!/bin/bash

set -eu

# Get neccessary files and dirs for plugin.
if [ "$(uname)" = "Linux" ]; then
  sudo apt-get update
  sudo apt-get upgrade
  # xsel is for tmux copy paste.
  # vim-gtk3 is for vim clipboard.
  sudo apt-get install -y vim git wget curl tmux xsel ibus-mozc xclip vim-gtk3
  wget https://raw.githubusercontent.com/tarurata/config/master/.bashrc-linux -P "${HOME}" -O ".bashrc"
  wget https://raw.githubusercontent.com/tarurata/config/master/.vimrc-linux -P "${HOME}" -O ".vimrc"
  # Install google-chorme
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install ./google-chrome-stable_current_amd64.deb
elif [ "$(uname)" = "Darwin" ]; then
  sudo brew install -y vim git wget curl tmux xsel
  wget https://raw.githubusercontent.com/tarurata/config/master/.bashrc-forMac -P "${HOME}" -O ".bashrc"
  wget https://raw.githubusercontent.com/tarurata/config/master/.vimrc-forMac -P "${HOME}" -O ".vimrc"
fi
wget https://raw.githubusercontent.com/tarurata/config/master/.tmux.conf -P "${HOME}"

# Change capsLock ctrl.
if [ -e /etc/default/keyboard ]; then
  echo 'XKBOPTIONS="ctrl:nocaps"' | sudo tee -a /etc/default/keyboard
fi

# Install vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c PlugInstall -c q -c q
