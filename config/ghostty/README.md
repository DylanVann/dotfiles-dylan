# Ghostty

Config and custom themes for [Ghostty](https://ghostty.org).

`install.sh` in the repo root symlinks this directory to `~/.config/ghostty`.

The `themes/` directory holds two custom themes matching Xcode 27's defaults,
and therefore the macOS light and dark appearance. Light is generated from the
classic `Default (Light).xccolortheme` bundled in Xcode. Dark is Xcode 27's
"Standard" workspace theme preset, a procedural recipe with no stored colors,
so its values were measured from the rendered editor (`#262626` background).
Ghostty's own `Xcode Light`/`Xcode Dark` predate both. The config picks between them
with `theme = light:...,dark:...`, so Ghostty follows the system appearance.

Reload a running Ghostty with Cmd+Shift+, after editing. The same themes are
ported to Zed in `../zed/themes`.
