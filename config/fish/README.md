# fish

Config for the [fish shell](https://fishshell.com).

`install.sh` in the repo root symlinks this directory to `~/.config/fish`.

`conf.d/theme.fish` sets the shell colors with the terminal's named ANSI colors
rather than hex values, so they follow the Ghostty theme (see `../ghostty`),
light or dark. `fish_variables` and tool-generated completions are ignored.
