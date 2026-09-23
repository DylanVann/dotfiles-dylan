# Karabiner Elements configuration

Caps Lock is a Hyper key (Escape when tapped). Holding Hyper plus a layer key opens a sublayer, and a third key runs a command:

- **b** browse: open sites
- **o** open: launch apps
- **w** window: hide, tabs, back/forward
- **s** system: volume, brightness, media, lock, voice dictation
- **v** move: hjkl arrows, paging, Homerow
- **c** music: play/pause, next, previous

The rules are written in TypeScript in `rules.ts` using the helpers in `utils.ts`, and `karabiner.json` is generated from them.

Window snapping and the launcher are not in these layers; they are Tinycast's own global hotkeys, set by `scripts/tinycast-settings.sh` in the repo root.

## Installation

1. Install and start [Karabiner Elements](https://karabiner-elements.pqrs.org/).
1. Delete the default `~/.config/karabiner` folder.
1. Symlink this directory to `~/.config/karabiner` by running `install.sh` in the repo root.
1. Restart the console user server: `` launchctl kickstart -k gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server ``.

## Development

```
bun install
```

installs the dependencies (one-time only).

```
bun run build
```

builds `karabiner.json` from `rules.ts`. The output is run through `karabiner_cli --format-json` so it matches what Karabiner writes back and stays diff-free.

```
bun run watch
```

watches the TypeScript files and rebuilds whenever they change.
