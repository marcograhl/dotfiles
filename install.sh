#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/.vimrc $HOME/.vimrc
ln -s $(pwd)/.vim $HOME/.vim
ln -s $(pwd)/.gitignore_global $HOME/.gitignore_global
ln -s $(pwd)/.gitconfig $HOME/.gitconfig
ln -s $(pwd)/.gitconfig-github $HOME/.gitconfig-github

vim -Es -u $HOME/.vimrc -c "PlugInstall | qa"
