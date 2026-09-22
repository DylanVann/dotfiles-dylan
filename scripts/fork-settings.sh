#!/usr/bin/env bash

# Fork keeps its settings in defaults rather than a config file (Preferences > General)

# Diff view font, matching Ghostty and Zed (installed by the Brewfile)
defaults write com.DanPristupov.Fork diffFontName -string "ShareTechMono-Regular"
defaults write com.DanPristupov.Fork diffFontSize -float 11

# Follow the system appearance
defaults write com.DanPristupov.Fork theme -string system

# Fork reads these on launch, so relaunch it if it's running
