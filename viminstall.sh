#!/bin/bash
# set -e         

yum install -y vim git wget
  
git clone https://github.com/VundleVim/Vundle.vim.git "${HOME}/.vim/bundle/Vundle.vim"
    
wget https://raw.githubusercontent.com/tarurata/vimrc/master/.vimrc -P "${HOME}"

vim +PluginInstall +qall
