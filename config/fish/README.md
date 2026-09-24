# fish

Config for the [fish shell](https://fishshell.com).

`install.sh` in the repo root symlinks this directory to `~/.config/fish`.

`conf.d/theme.fish` sets the shell colors with the terminal's named ANSI colors
rather than hex values, so they follow the Ghostty theme (see `../ghostty`),
light or dark. `fish_variables` and tool-generated completions are ignored.

`config.fish` declares every PATH entry with `fish_add_path -g`, so PATH is
rebuilt from this file each session. Plain `fish_add_path` would persist the
entry in the universal `fish_user_paths` (in `fish_variables`), where it would
outlive its removal from the config. If a tool's installer adds itself that
way, move the line here and run `set -eU fish_user_paths` once.
