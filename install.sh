#!/usr/bin/env bash
#
# Symlinks the configs in this repo into place and installs the Brewfile.
# Safe to rerun. Existing files that aren't symlinks are left alone and reported.

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local source="$1" target="$2"
  if [ -L "$target" ]; then
    ln -sfn "$source" "$target"
    echo "linked  $target -> $source"
  elif [ -e "$target" ]; then
    echo "skipped $target (exists and isn't a symlink)"
  else
    mkdir -p "$(dirname "$target")"
    ln -s "$source" "$target"
    echo "linked  $target -> $source"
  fi
}

# ~/.config/<app> -> <repo>/<app>
for app in fish ghostty karabiner; do
  link "$DOTFILES/$app" "$HOME/.config/$app"
done

# ~/.<dotfile> -> <repo>/symlinks/dotfiles/.<dotfile>
for file in "$DOTFILES"/symlinks/dotfiles/.*; do
  name="$(basename "$file")"
  [ "$name" = "." ] || [ "$name" = ".." ] && continue
  link "$file" "$HOME/$name"
done

# Homebrew packages
if command -v brew > /dev/null; then
  brew bundle --file="$DOTFILES/Brewfile" --no-upgrade
else
  echo "skipped Brewfile (brew isn't installed)"
fi
