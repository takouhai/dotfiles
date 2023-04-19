# ===========================
#            _
#           | |
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|
# ===========================
# author: @takouhai
# license: wtfpl
# ===========================

# == theme ==
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH_THEME="powerlevel10k/powerlevel10k"

# == terminal ==
# oh-my-zsh
## zsh settings
export UPDATE_ZSH_DAYS=7
export COMPLETION_WAITING_DOTS="true"
## plugins
plugins=(git rvm direnv rust python)
## load zsh
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# terminal settings
export TERM=xterm-256color
export TERMINAL=alacritty
export VISUAL="nano"
export GRIM_DEFAULT_DIR="${HOME}/Pictures"
GPG_TTY=$(tty)
export GPG_TTY

# == aliases ==
# sys
## command aliases for arch
alias sys.update="trizen -Syu"

# dotfiles
## configuration shortcuts
alias dot.files="cd ~/.dotfiles"
alias .files="dot.files"

alias dot.config="subl ~/.dotfiles"
alias .config="dot.config"

# zsh
## zsh reload configuration
alias zsh.reload="clear && source ~/.zshrc"
alias .reload="zsh.reload"

## upgrade oh-my-zsh
alias zsh.upgrade="omz update"
alias .upgrade="zsh.upgrade"

# git
## runs an automatic git garbage collector
alias git.clean="git gc --auto"
## clean dead origin branches
alias git.prune="git remote prune origin"

# de specific
## kde
alias kde.start="kstart5 plasmashell"
alias kde.kill="kquitapp5 plasmashell"
alias kde.restart="kde.kill && kde.start"

# == misc ==
## i'm using modern-unix as a reference for this, highly recommended
## https://github.com/ibraheemdev/modern-unix
## aliasing for bat
alias cat="bat"
## better cmatrix alternative
alias cmatrix="tmatrix"
## aliasing for lsd
alias ls="lsd"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"

if [[ $(uname) != "Darwin" ]]; then
  alias open="xdg-open"
fi

# == dev tools ==

# alias for thefuck, fixer for command line borks
## https://github.com/nvbn/thefuck
eval $(thefuck --alias)

# rust
export PATH="$PATH:$HOME/.cargo/env"
export PATH="$PATH:$(which cargo)"
export RUST_SRC_PATH="$(rustc --print sysroot)"

# python
export PATH="$PATH:$(which python)"

# nvm
## this loads nvm, adds nvm bash_completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
if [[ $(uname) != "Darwin" ]]; then
  source /usr/share/nvm/init-nvm.sh
fi

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="$HOME/.emacs.d/bin:$PATH"

# terminal decorations
## fortune, piped through to pokemonsay
alias pokefortune="fortune -se | pokemonsay"

# powerline10k
## should be at the bottom of your config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# rvm
export PATH="$PATH:$HOME/.rvm/bin"

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# deno 
export PATH="/home/taco/.deno/bin:$PATH"
