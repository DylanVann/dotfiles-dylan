# Working on these dotfiles

macOS setup for fish, Ghostty, Zed and a few CLI tools. Read
README.md first; each folder under `config/` has its own README with the
details for that app.

## Setting up a Mac

1. Clone into a permanent location such as `~/Developer/dotfiles-dylan`. The
   installer makes symlinks into this checkout, so don't install from a
   temporary directory.
2. Run `./install.sh --dry-run`, read the plan, then `./install.sh`. Anything it
   replaces is moved to `~/.local/state/dotfiles/backups/<timestamp>/`; tell
   the user what was backed up.
3. The scripts in `scripts/` change system and app settings and are run by
   hand, one at a time, when the user asks for them. Don't run them as part of
   installation.
4. App switching is rcmd (right cmd + a letter) and window snapping is
   Tinycast. Both come from the Brewfile; rcmd keeps its own settings and
   isn't configured from here. Caps Lock is Escape through the launch agent
   that `scripts/remap-caps-lock-to-escape.sh` installs.

## Editing

- Shell colors come from the terminal's 16-color palette, not hex values, so
  fish follows whichever Ghostty theme is active. Keep it that way; don't add
  hard-coded colors to the fish config.
- `config/fish/fish_variables` and `config/fish/completions/` are machine
  state and stay untracked.
- Machine-specific settings go in files the repo includes but doesn't track:
  `~/.gitconfig.local` for the Git identity and signing key.
- No personal names, emails or absolute home paths in tracked config; the
  README is the only place they belong.
- Don't add new `defaults` writes the user hasn't asked for. In particular the
  Dock animation stays on and tiled-window margins are left alone.
- Commit messages: plain imperative subject, no `Co-Authored-By` trailer.

## Verifying

```sh
bash -n install.sh scripts/*.sh
fish -n config/fish/config.fish config/fish/conf.d/*.fish config/fish/functions/*.fish
ghostty +validate-config
./install.sh --dry-run
```

The GitHub Actions workflow in `.github/workflows/check.yml` runs the same
checks on a macOS runner and installs twice to confirm reruns are no-ops.
