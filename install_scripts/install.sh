#!/usr/bin/env bash

# homebrew
./homebrew.sh

# Install python with pyenv.
brew install pyenv

# oh my zsh
./oh-my-zh.sh

# tmux package manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
