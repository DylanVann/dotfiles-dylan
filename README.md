# Dylan's Dotfiles

📠 Terminally ill.

```sh
git clone https://github.com/DylanVann/dotfiles-dylan ~/Developer/dotfiles-dylan
~/Developer/dotfiles-dylan/install.sh
```

- `config/` is symlinked into `~/.config` (one folder per app; Zed keeps other
  state in its folder, so only its files are linked).
- `home/` is symlinked into `~` (dotfiles).
- `scripts/` are one-off macOS settings, run by hand.
- `Brewfile` is installed with `brew bundle`.

`install.sh` makes the symlinks and installs the `Brewfile`. It never overwrites
a real file, so move any existing config out of the way first.
