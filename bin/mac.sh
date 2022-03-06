#!/usr/bin/bash

# Dock Autohide
defaults write com.apple.dock autohide -bool true && \
killall Dock

# Dock Size
defaults write com.apple.dock tilesize -int 40 && \
killall Dock

# Show hidden App Icons
defaults write com.apple.dock showhidden -bool true && \
killall Dock

# Show all file extensions inside the Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" && killall Finder

# Show hidden files inside the Finder
defaults write com.apple.Finder "AppleShowAllFiles" -bool "true" && killall Finder

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "