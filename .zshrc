export RBENV_ROOT="$HOME/.rbenv"
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$HOME/bin:/usr/local/bin:$PATH

export RBENV_ROOT="$HOME/.rbenv"
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$HOME/bin:/usr/local/bin:$PATH

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

export LANG=en_US.UTF-8
export EDITOR='vim'

export HOMEBREW_BINTRAY_USER=issyl0
export HOMEBREW_DEVELOPER=1
export HOMEBREW_GITHUB_USER=issyl0
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1

alias cat=bat

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U promptinit; promptinit
prompt spaceship
SPACESHIP_PROMPT_ORDER=(user host dir git line_sep char)
SPACESHIP_USER_SHOW=always
SPACESHIP_HOST_SHOW=always
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_DIR_TRUNC=0
SPACESHIP_GIT_PREFIX="on"
SPACESHIP_GIT_BRANCH_PREFIX=" "
SPACESHIP_GIT_BRANCH_SUFFIX=""
SPACESHIP_GIT_STATUS_SHOW=false
SPACESHIP_CHAR_SYMBOL="➜ "
