#!/usr/bin/env bash
#
# macOS and app settings that live in `defaults`. Safe to rerun.
# Running apps keep their old values until relaunched; Finder is restarted at the end.
#
# Each domain touched below is exported first to
# ~/.local/state/dotfiles/backups/<timestamp>/<domain>.plist, so the previous
# values can be restored with `defaults import <domain> <file>`.

set -euo pipefail

BACKUPS="$HOME/.local/state/dotfiles/backups/$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUPS"
for domain in NSGlobalDomain com.apple.HIToolbox com.apple.finder com.DanPristupov.Fork; do
  defaults export "$domain" "$BACKUPS/$domain.plist"
done
echo "Previous settings saved to $BACKUPS"

# Keyboard
# Key repeat instead of the press-and-hold accent popup
defaults write -g ApplePressAndHoldEnabled -bool false
# Repeat faster than System Settings allows (its minimums are 15 and 2)
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
# Globe/fn key does nothing (0 = nothing, 1 = input source, 2 = emoji picker, 3 = dictation)
defaults write com.apple.HIToolbox AppleFnUsageType -int 0
# Unbind ctrl+cmd+space by giving the "Emoji & Symbols" menu item a NUL shortcut in every app
defaults write -g NSUserKeyEquivalents -dict-add "Emoji & Symbols" '\0'

# Finder
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write -g AppleShowAllExtensions -bool true
# No icons on the desktop
defaults write com.apple.finder CreateDesktop -bool false

# Fork (Preferences > General)
# Diff font matching Ghostty and Zed; the font is installed by the Brewfile
defaults write com.DanPristupov.Fork diffFontName -string "ShareTechMono-Regular"
defaults write com.DanPristupov.Fork diffFontSize -float 11
defaults write com.DanPristupov.Fork theme -string system

killall Finder
