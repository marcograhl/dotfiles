#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

sudo apt install -y tmux
mkdir -p $HOME/.config/nvim/

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
ln -s $(pwd)/.tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/.config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s $(pwd)/.gitignore_global $HOME/.gitignore_global
ln -s $(pwd)/.gitconfig $HOME/.gitconfig
ln -s $(pwd)/.gitconfig-github $HOME/.gitconfig-github

nvim -Es -u $HOME/.config/nvim/init.vim -c "PlugInstall | qa"
