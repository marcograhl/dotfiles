#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

if [[ -z "${CODESPACES}" ]]; then
  echo "==> assuming installing on macOS"
  brew bundle
else
  echo "==> installing dotfiles in codespace"
  sudo apt-get update
  if command -v brew >/dev/null 2>&1; then
    brew install neovim
  else
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository -y ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get -y install neovim
  fi
  sudo apt-get -y install fd-find python3-dev python3-pip tmux zsh
  sudo apt install -y -o Dpkg::Options::="--force-overwrite" bat ripgrep
fi

mkdir -p ~/.tmux/plugins/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mkdir -p ~/.config/nvim/autoload/
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -sf $(pwd)/.tmux.conf $HOME/.tmux.conf
ln -sf $(pwd)/.config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -sf $(pwd)/.gitignore_global $HOME/.gitignore_global
ln -sf $(pwd)/.gitconfig $HOME/.gitconfig
ln -sf $(pwd)/.gitconfig-github $HOME/.gitconfig-github
ln -sf $(pwd)/starship.toml $HOME/.config/starship.toml

nvim --headless +PlugInstall +qa

sudo chsh -s "$(which zsh)" "$(whoami)"
