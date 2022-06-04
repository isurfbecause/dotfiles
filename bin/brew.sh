#!/usr/bin/bash

# Check if program is not installed
# P is Program
function not_installed() {
  P=$1
  if ! command -v $P &> /dev/null; then
     echo "$P found, not installing"
  else
    printf "\n$P not found.\nInstalling $P..."
  fi
}

if not_installed brew; then
  open https://brew.sh/
  exit
fi

brew update
brew upgrade

# Browsers
P=google-chrome
if not_installed $P; then
  brew install --cask $P
  exit
fi

# Email
brew install --cask superhuman

# Alfred - Spotlight and clipboard manager
brew install --cask alfred

# Calendar
#brew install --cask fantastical

# Coding
#brew install --cask visual-studio-code
#brew install --cask iterm2
#brew install gh
brew install --cask kitty
brew install diff-so-fancy
brew install circleci
brew install awscli@1

# DB GUI
brew install --cask dbeaver-community

# Security
#brew install bitwarden

# Bash linting
brew install shellcheck

# Python 3
#brew install python3 && cp /usr/local/bin/python3 /usr/local/bin/python

brew install nvim
brew install the_silver_searcher
brew install ripgrep
brew install tmux
# brew install terraform

# Graphs for terraform
#brew install graphviz

# Node.js
# Fast Node Manager (faster than nvm on startup)
brew install fnm
brew install yarn

# Screenshot Tool
brew install --cask cleanshot

# Mac window manager
brew install --cask rectangle

# Brightness
brew install --cask flux

# Tasks
# akiflow not available
brew install --cask todoist

# Notes
brew install --cask mem
# roamresearch not available

# VPN
brew install --cask nordvpn
brew install --cask openvpn-connect
brew install --cask tunnelblick

# Communication
brew install --cask slack

# Video Conferencing
brew install --cask zoom

# Mic Audio
brew install --cask krisp

# Music
brew install --cask spotify
brew install --cask pandora

# Linux Tools

brew install fzf
brew install htop
brew install jq
brew install tree
brew install wget

# Key mapping
brew install --cask karabiner-elements

# Security
# brew install --cask little-snitch
# brew install --cask micro-snitch

# System
brew install --cask istat-menus

# Fonts
brew tap homebrew/cask-fonts
brew install --cask font-mononoki-nerd-font
brew tap homebrew/cask-fonts && brew install font-Fira-Code-nerd-font

echo "Will need to install akiflow, roamresearch,  manually"
