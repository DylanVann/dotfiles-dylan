# Dylan's Dotfiles

📠 Terminally ill.

```sh
git clone https://github.com/DylanVann/dotfiles-dylan ~/Developer/dotfiles-dylan
~/Developer/dotfiles-dylan/install.sh
```

- `config/` is symlinked into `~/.config` (one folder per app; Zed keeps other
  state in its folder, so only its files are linked).
- `home/` is symlinked into `~` (dotfiles).
- `scripts/macos-settings.sh` applies the `defaults` settings (keyboard, Finder,
  Fork); `scripts/tinycast-settings.sh` sets the Tinycast hotkeys (launcher on
  cmd+space, window snapping on ctrl+opt+cmd); `scripts/remap-caps-lock-to-escape.sh`
  installs a login agent for the Caps Lock remap. All are run by hand.
- `Brewfile` is installed with `brew bundle`.

`install.sh` makes the symlinks and installs the `Brewfile`. It is safe to rerun:
links that already point into the repo are left alone, and anything else in the
way (a config folder an app created, an old dotfile) is moved to
`~/.local/state/dotfiles/backups/<timestamp>/` before the link is made.
`--dry-run` prints the plan without changing anything, `--skip-brew` skips the
Brewfile, and `--target DIR` installs somewhere other than `~` for testing.

`scripts/macos-settings.sh` exports each `defaults` domain it touches to the
same backups folder before writing.

The GitHub Actions workflow runs the installer twice on a macOS runner, checks
the shell and fish syntax, and validates the Ghostty config. `AGENTS.md` has
the same checks and the repo conventions for AI agents.

App switching is [rcmd](https://lowtechguys.com/rcmd) (right cmd + a letter,
from the App Store via `mas`) and it keeps its own settings.
