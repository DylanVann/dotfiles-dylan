#!/usr/bin/env bash

# Make the Globe/fn key do nothing (0 = nothing, 1 = change input source, 2 = emoji picker, 3 = dictation)
defaults write com.apple.HIToolbox AppleFnUsageType -int 0

# Unbind ctrl+cmd+space by overriding the "Emoji & Symbols" menu item's shortcut in every app with a NUL key
defaults write -g NSUserKeyEquivalents -dict-add "Emoji & Symbols" '\0'

# Running apps keep the old shortcut until they are relaunched
