# Ghostty

Config and custom themes for [Ghostty](https://ghostty.org).

`~/.config/ghostty` is a symlink to this directory:

```sh
ln -s ~/Developer/dotfiles-dylan/ghostty ~/.config/ghostty
```

The `themes/` directory holds two custom themes generated from the
`Default (Light)` and `Default (Dark)` `.xccolortheme` files bundled in Xcode 27
(Ghostty's own `Xcode Light`/`Xcode Dark` predate the current palette), so they
match Xcode's Default editor and therefore the macOS light and dark appearance. The config picks between them
with `theme = light:...,dark:...`, so Ghostty follows the system appearance.

Reload a running Ghostty with Cmd+Shift+, after editing.
