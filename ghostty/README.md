# Ghostty

Config and custom themes for [Ghostty](https://ghostty.org).

`~/.config/ghostty` is a symlink to this directory:

```sh
ln -s ~/Developer/dotfiles-dylan/ghostty ~/.config/ghostty
```

The `themes/` directory holds two custom themes derived from Ghostty's bundled
`Xcode Light` and `Xcode Dark`, matching Xcode's Default editor palettes and
therefore the macOS light and dark appearance. The config picks between them
with `theme = light:...,dark:...`, so Ghostty follows the system appearance.

Reload a running Ghostty with Cmd+Shift+, after editing.
