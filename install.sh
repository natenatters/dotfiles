#!/bin/sh
# Symlink dotfiles into place. Existing files are backed up to *.bak first.
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
  mkdir -p "$(dirname "$2")"
  if [ -e "$2" ] && [ ! -L "$2" ]; then mv "$2" "$2.bak"; fi
  ln -sfn "$1" "$2"
  echo "linked $2 -> $1"
}

link "$DIR/vscodium/settings.json" "$HOME/Library/Application Support/VSCodium/User/settings.json"
