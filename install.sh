#!/bin/bash

if [[ -z "${CODESPACES}" ]]; then
  echo "==> this script is only for codespaces"
  exit 1
else
  echo "==> installing dotfiles in codespace"
fi

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

PACKAGES_NEEDED="\
    fzf \
    neovim \
    tmux \
    fd"

sudo add-apt-repository -y ppa:neovim-ppa/stable

if ! dpkg -s ${PACKAGES_NEEDED} > /dev/null 2>&1; then
    if [ ! -d "/var/lib/apt/lists" ] || [ "$(ls /var/lib/apt/lists/ | wc -l)" = "0" ]; then
        sudo apt-get update
    fi
    sudo apt-get -y -q install ${PACKAGES_NEEDED}
fi

sudo apt install -y -o Dpkg::Options::="--force-overwrite" bat ripgrep

npm install -g \
  typescript \
  prettier \
  eslint \
  typescript-language-server \
  bash-language-server

mkdir -p $HOME/.config/nvim/

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
ln -s $(pwd)/.tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/.config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s $(pwd)/.gitignore_global $HOME/.gitignore_global
ln -s $(pwd)/.gitconfig $HOME/.gitconfig
ln -s $(pwd)/.gitconfig-github $HOME/.gitconfig-github

nvim --headless +PlugInstall +qa

sudo chsh -s "$(which zsh)" "$(whoami)"
