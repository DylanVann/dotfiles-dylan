#!/usr/bin/env bash

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Reduce initial key repeat delay, normal minimum is 15 (225 ms)
defaults write -g InitialKeyRepeat -int 10 # 

# Reduce key repeat time, normal minimum is 2 (30 ms)
defaults write -g KeyRepeat -int 1

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true