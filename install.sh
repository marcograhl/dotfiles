#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

sudo apt-get update
sudo apt install -y -o Dpkg::Options::="--force-overwrite" bat


sudo apt-get install fuse libfuse2
sudo modprobe fuse
sudo groupadd fuse
sudo usermod -a -G fuse "$(whoami)"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

mkdir -p $HOME/.config/nvim/
ln -sf $(pwd)/.config/nvim/init.lua $HOME/.config/nvim/init.lua
ln -sf $(pwd)/.gitignore_global $HOME/.gitignore_global

# Auto install packer plugins to avoid yelling errors on first boot
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
