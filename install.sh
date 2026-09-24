#!/usr/bin/env bash
#
# Symlinks the configs in this repo into place and installs the Brewfile.
# Safe to rerun: links that already point here are left alone. Anything else
# in the way (a real file, a directory, a link to somewhere else) is moved to
# ~/.local/state/dotfiles/backups/<timestamp>/ before the link is made.
#
# Usage: install.sh [--dry-run] [--skip-brew] [--target DIR]
#   --dry-run    Print what would happen without touching anything
#   --skip-brew  Don't run brew bundle (CI, or a machine without Homebrew)
#   --target DIR Install into DIR instead of $HOME (for testing)

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="$HOME"
DRY_RUN=0
SKIP_BREW=0

while [ $# -gt 0 ]; do
  case "$1" in
    --dry-run) DRY_RUN=1 ;;
    --skip-brew) SKIP_BREW=1 ;;
    --target)
      [ $# -ge 2 ] || { echo "--target needs a directory" >&2; exit 2; }
      TARGET="$2"
      shift
      ;;
    -h | --help)
      sed -n '3,/^$/p' "$0" | sed 's/^# \{0,1\}//'
      exit 0
      ;;
    *) echo "unknown option: $1 (see --help)" >&2; exit 2 ;;
  esac
  shift
done

case "$TARGET" in
  "$DOTFILES" | "$DOTFILES"/*) echo "--target must not be the repo itself" >&2; exit 2 ;;
esac

BACKUPS="$TARGET/.local/state/dotfiles/backups/$(date +%Y%m%d-%H%M%S)"
BACKED_UP=0

run() {
  if [ "$DRY_RUN" = 1 ]; then
    echo "would run: $*"
  else
    "$@"
  fi
}

# Move whatever is at $1 into the backup folder, keeping its path relative to $TARGET.
backup() {
  local path="$1" relative="${1#"$TARGET"/}" saved
  saved="$BACKUPS/$relative"
  echo "backed up $path -> $saved"
  if [ "$DRY_RUN" = 0 ]; then
    mkdir -p "$(dirname "$saved")"
    mv "$path" "$saved"
  fi
  BACKED_UP=1
}

link() {
  local source="$1" target="$2"
  if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
    echo "ok      $target"
    return
  fi
  if [ -e "$target" ] || [ -L "$target" ]; then
    backup "$target"
  fi
  echo "linked  $target -> $source"
  if [ "$DRY_RUN" = 0 ]; then
    mkdir -p "$(dirname "$target")"
    ln -s "$source" "$target"
  fi
}

# Themes come from a submodule (vendor/), which the config folders link into
run git -C "$DOTFILES" submodule update --init --quiet

# ~/.config/<app> -> <repo>/config/<app>
# Apps that keep other state in their config folder get each file linked instead.
LINK_FILES="zed"
for dir in "$DOTFILES"/config/*/; do
  app="$(basename "$dir")"
  if [[ " $LINK_FILES " == *" $app "* ]]; then
    for file in "$dir"*; do
      [ "$(basename "$file")" = "README.md" ] && continue
      link "$file" "$TARGET/.config/$app/$(basename "$file")"
    done
  else
    link "${dir%/}" "$TARGET/.config/$app"
  fi
done

# ~/.<dotfile> -> <repo>/home/.<dotfile>
for file in "$DOTFILES"/home/.*; do
  name="$(basename "$file")"
  [ "$name" = "." ] || [ "$name" = ".." ] && continue
  link "$file" "$TARGET/$name"
done

# Directories ~/.vimrc points backups, swap files and undo history at
run mkdir -p "$TARGET/.vim/backup" "$TARGET/.vim/swp" "$TARGET/.vim/undo"

# Homebrew packages
if [ "$SKIP_BREW" = 1 ]; then
  echo "skipped Brewfile (--skip-brew)"
elif command -v brew > /dev/null; then
  run brew bundle --file="$DOTFILES/Brewfile" --no-upgrade
else
  echo "skipped Brewfile (brew isn't installed)"
fi

# bat only picks up themes from its config folder after a cache rebuild
if command -v bat > /dev/null; then
  if [ "$DRY_RUN" = 1 ]; then
    echo "would run: bat cache --build"
  else
    bat cache --build > /dev/null && echo "rebuilt bat cache"
  fi
fi

if [ "$BACKED_UP" = 1 ]; then
  echo
  [ "$DRY_RUN" = 1 ] && echo "Replaced files would be moved to $BACKUPS" || echo "Replaced files were moved to $BACKUPS"
  echo "To restore one, remove the link and move the backup back."
fi
