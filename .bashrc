# Supress warning in macos
export BASH_SILENCE_DEPRECATION_WARNING=1

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
#shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
SHELL=/bin/bash

# PS1 Prompt customization
_MAGENTA=$(tput setaf 5)
_GREEN=$(tput setaf 2)
_RESET=$(tput sgr0)

export PS1='\[${_MAGENTA}\] \w \[${_GREEN}\] \[${_RESET}\]'

# some more ls aliases
alias la='ls -A'
alias l='ls -CF'

# Apps

# Paths
export PATH=/home/winston/.local/bin:$PATH

# TMUX
[[ -n $TMUX ]] && export TERM="screen-256color"

# GO
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/bin/go
export GO111MODULE="on"

# FZF
[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash
export FZF_DEFAULT_COMMAND='fd --type file --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# AWS cli
export PATH="/opt/homebrew/opt/awscli@1/bin:$PATH"

source $HOME/.welcome_techrc

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

source $HOME/.sharedProfile
