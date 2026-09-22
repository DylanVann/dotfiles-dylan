# Dylan's Dotfiles

📠 Terminally ill.

```sh
git clone https://github.com/DylanVann/dotfiles-dylan ~/Developer/dotfiles-dylan
~/Developer/dotfiles-dylan/install.sh
```

`install.sh` symlinks `fish`, `ghostty` and `karabiner` into `~/.config`, symlinks
everything in `symlinks/dotfiles` into `~`, and installs the `Brewfile`. It never
overwrites a real file, so move any existing config out of the way first.

The other scripts in the root apply one-off macOS settings and can be run on
their own.
