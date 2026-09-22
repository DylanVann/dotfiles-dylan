# fish

Config for the [fish shell](https://fishshell.com).

`~/.config/fish` is a symlink to this directory:

```sh
ln -s ~/Developer/dotfiles-dylan/config/fish ~/.config/fish
```

`conf.d/theme.fish` sets the shell colors with the terminal's named ANSI colors
rather than hex values, so they follow the Ghostty theme (see `../ghostty`),
light or dark. `fish_variables` and tool-generated completions are ignored.
