#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x
sudo apt-get install -y tmux

sudo apt-get update
sudo apt install -y -o Dpkg::Options::="--force-overwrite" bat

apt-get install wget libnss3-tools
sudo apt-get install ripgrep
sudo apt install fzf
sudo apt-get install fuse libfuse2
rt-v1.4.3-linux-amd64
sudo modprobe fuse
sudo groupadd fuse
sudo usermod -a -G fuse "$(whoami)"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

sudo wget -O mkcert https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
mkdir -p $HOME/.config/nvim/
mkdir -p $HOME/.config/nvim/ftdetect
ln -sf $(pwd)/.config/nvim/init.lua $HOME/.config/nvim/init.lua
ln -sf $(pwd)/.config/nvim/ftdetect/astro.lua $HOME/.config/nvim/ftdetect/astro.lua
ln -sf $(pwd)/.gitignore_global $HOME/.gitignore_global
ln -sf $(pwd)/.tmux.conf $HOME/.tmux.conf
sudo mv $(pwd)/mkcert /usr/bin
sudo chmod +x /usr/bin/mkcert
tmux source-file ~/.tmux.conf
# Auto install packer plugins to avoid yelling errors on first boot
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
