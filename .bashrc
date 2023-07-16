#!/bin/bash
# Paths
export PATH=/home/winston/.local/bin:$PATH

# GO
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/bin/go
export GO111MODULE="on"

# FZF
[ -f "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"
export FZF_DEFAULT_COMMAND='fd --type file --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Alias definitions.
source "$HOME/.bash_aliases"
source "$HOME/.bash_settings"
