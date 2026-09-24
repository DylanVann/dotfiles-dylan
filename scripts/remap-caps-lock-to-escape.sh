#!/usr/bin/env bash

# Remap Caps Lock (0x39) to Escape (0x29) for every keyboard at the HID level.
MAPPING='{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029}]}'
LABEL="local.remap-caps-lock-to-escape"
PLIST="$HOME/Library/LaunchAgents/$LABEL.plist"

# Apply now
hidutil property --set "$MAPPING" > /dev/null

# hidutil mappings are lost on reboot, so reapply at every login
mkdir -p "$HOME/Library/LaunchAgents"
cat > "$PLIST" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>$LABEL</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/hidutil</string>
        <string>property</string>
        <string>--set</string>
        <string>$MAPPING</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
EOF

launchctl bootout "gui/$(id -u)/$LABEL" 2> /dev/null
launchctl bootstrap "gui/$(id -u)" "$PLIST"
