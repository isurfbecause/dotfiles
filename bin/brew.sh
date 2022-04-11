#!/usr/bin/bash

brew update
brew upgrade

# Dotfiles
#brew install yadm

# Browsers
brew install --cask google-chrome

# Email
brew install --cask superhuman

# Spotlight and clipboard
brew install --cask alfred

# Calendar
#brew install --cask fantastical

# Coding
brew install --cask visual-studio-code
brew install --cask iterm2
brew install diff-so-fancy
brew install gh
brew install circleci
brew install awscli@1
brew install yarn

# Python 3
#brew install python3 && cp /usr/local/bin/python3 /usr/local/bin/python

brew install nvim
brew install the_silver_searcher
# brew install terraform

# Fast Node Manager (faster than nvm on startup)
# brew install fnm

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
brew install openvpn

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
brew install --cask alfred
brew install fzf
brew install htop
brew install jq
brew install tree

# Key mapping
brew install --cask karabiner-elements

# Security
# brew install --cask little-snitch
# brew install --cask micro-snitch

# System
# brew install --cask istat-menus

echo "Will need to install akiflow, roamresearch,  manually"
