# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
#shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000


PROMPT='%F{magenta} %~ %F{green}%f '

# some more ls aliases
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

source ~/.sharedProfile

# Apps

# Fast Node Manager
eval "$(fnm env --use-on-cd)"

# AWS cli
export PATH="/usr/local/opt/awscli@1/bin:$PATH"


# Paths
export PATH=/home/winston/.local/bin:$PATH
