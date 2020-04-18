export ZSH="${HOME}/.oh-my-zsh"
export ZSH_THEME="issyl0-bira"

export RBENV_ROOT="$HOME/.rbenv"
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$HOME/bin:/usr/local/bin:$PATH

plugins=(
  brew
  bundler
  colorize
  fzf
  git
  gpg-agent
  osx
  rake
  rbenv
  ripgrep
  ruby
  terraform
  tmux
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR='vim'

export RBENV_ROOT="$HOME/.rbenv"
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$HOME/bin:/usr/local/bin:$PATH

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

export HOMEBREW_BINTRAY_USER=issyl0
export HOMEBREW_DEVELOPER=1
export HOMEBREW_GITHUB_USER=issyl0
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1

alias cat=bat
unalias gds

if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh/site-functions:$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi
