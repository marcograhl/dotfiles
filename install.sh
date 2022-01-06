#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

sudo apt install -y tmux

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s $(pwd)/.tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/.vimrc $HOME/.vimrc
ln -s $(pwd)/.gitignore_global $HOME/.gitignore_global
ln -s $(pwd)/.gitconfig $HOME/.gitconfig
ln -s $(pwd)/.gitconfig-github $HOME/.gitconfig-github

mkdir -p $HOME/.config/coc
vim -Es -u $HOME/.vimrc -c "PlugInstall | qa"
vim -Es -u $HOME/.vimrc -c "CocInstall | qa"
