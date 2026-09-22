# Zed

Settings and custom themes for [Zed](https://zed.dev).

`install.sh` in the repo root symlinks the files in this directory into
`~/.config/zed` individually, because Zed keeps other state in that folder.

`themes/xcode-system.json` holds "Xcode System Light" and "Xcode System Dark",
ports of the Ghostty themes in `../ghostty/themes` (see that README for where
the colors come from). The terminal palette, editor background, foreground,
cursor and selection are copied directly; the syntax colors come from the same
Xcode roles the Ghostty ANSI slots were derived from, and the light theme takes
a few extra roles (number, link) straight from Xcode's `Default (Light)`
theme since the 16 ANSI slots couldn't hold them. `settings.json` selects them
with `"theme": { "mode": "system", ... }`, so Zed follows the system
appearance.
