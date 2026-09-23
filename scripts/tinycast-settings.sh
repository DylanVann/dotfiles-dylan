#!/usr/bin/env bash
#
# Tinycast hotkeys and settings, written straight to its defaults. Safe to rerun.
# Tinycast reads these on launch, so it is restarted at the end.
#
# The window chords are ctrl+opt+cmd+<key> (the old BetterSnapTool layout).

set -euo pipefail

APP=com.tinycast.app
CTRL_OPT_CMD=6400 # Carbon: control 4096 + option 2048 + command 256

hotkey() {
  local key="$1" code="$2" mods="$3"
  defaults write "$APP" "hotkey.$key" -string \
    "{\"combo\":{\"_0\":{\"carbonKeyCode\":$code,\"carbonModifiers\":$mods}}}"
}

# Launcher on cmd+space (Spotlight's shortcut is already off; Raycast used it before)
hotkey togglePalette 49 256

# Window management (Carbon key codes: K=40 J=38 L=37 I=34 ,=43 U=32 O=31 M=46 .=47)
defaults write "$APP" windowManagementEnabled -bool true
hotkey windowCommand.maximize             40 $CTRL_OPT_CMD
hotkey windowCommand.left-half            38 $CTRL_OPT_CMD
hotkey windowCommand.right-half           37 $CTRL_OPT_CMD
hotkey windowCommand.top-half             34 $CTRL_OPT_CMD
hotkey windowCommand.bottom-half          43 $CTRL_OPT_CMD
hotkey windowCommand.top-left-quarter     32 $CTRL_OPT_CMD
hotkey windowCommand.top-right-quarter    31 $CTRL_OPT_CMD
hotkey windowCommand.bottom-left-quarter  46 $CTRL_OPT_CMD
hotkey windowCommand.bottom-right-quarter 47 $CTRL_OPT_CMD

osascript -e 'tell application "Tinycast" to quit' 2> /dev/null || true
sleep 1
open -a Tinycast
