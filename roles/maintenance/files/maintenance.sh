#!/bin/bash

set -euo pipefail

cleanup() {
  local status=$?
  if [[ $status -eq 0 ]]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') Maintenance completed successfully."
  else
    echo "$(date '+%Y-%m-%d %H:%M:%S') Maintenance failed (exit code $status)."
  fi
}

trap cleanup EXIT

# Find all .DS_Store files and delete them
fd -HI '^\.DS_Store$' "$HOME" --exec-batch rm -f

# Empty the Trash on all mounted volumes (immediately) and the main HDD (every 7 days)...
rm -rf /Volumes/*/.Trashes/*
fd -HI . "$HOME/.Trash" --changed-before 7d --exec-batch rm -rf

trash_contents() {
  local dir="${1:-}"

  [[ -d "$dir" ]] || return 0

  mkdir -p "$HOME/.Trash"

  shopt -s dotglob nullglob
  mv "$dir"/* "$HOME/.Trash/" 2>/dev/null || true
  shopt -u dotglob
}

# Clear System Log Files...
trash_contents "/private/var/log/asl/"*.asl
trash_contents "/Library/Logs/DiagnosticReports/"*
trash_contents "/Library/Logs/Adobe/"*
trash_contents "$HOME/Library/Containers/com.apple.mail/Data/Library/Logs/Mail/"*
trash_contents "$HOME/Library/Logs/CoreSimulator/"*

# Clear Spotify Cache Files...
trash_contents "$HOME/Library/Application Support/Spotify/PersistentCache/Update/"*.tbz
trash_contents "$HOME/Library/Caches/com.spotify.client/Data"

# Clear Adobe Cache Files...
trash_contents "$HOME/Library/Application Support/Adobe/Common/Media Cache Files/"*

# Cleanup iOS Applications...
trash_contents "$HOME/Music/iTunes/iTunes Media/Mobile Applications/"*

# Remove iOS Device Backups...
trash_contents "$HOME/Library/Application Support/MobileSync/Backup/"*

# Cleanup XCode Derived Data and Archives...
trash_contents "$HOME/Library/Developer/Xcode/DerivedData/"*
trash_contents "$HOME/Library/Developer/Xcode/Archives/"*
