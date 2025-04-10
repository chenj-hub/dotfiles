#!/bin/bash

# Find all .DS_Store files and delete them
find / -name ".DS_Store" -type f -delete

# Empty the Trash on all mounted volumes and the main HDD...
rm -rf "/Volumes/*/.Trashes/*"
rm -rf "$HOME/.Trash/*"

# Clear System Log Files...
rm -rf "/private/var/log/asl/*.asl"
rm -rf "/Library/Logs/DiagnosticReports/*"
rm -rf "/Library/Logs/Adobe/*"
rm -rf "$HOME/Library/Containers/com.apple.mail/Data/Library/Logs/Mail/*"
rm -rf "$HOME/Library/Logs/CoreSimulator/*"

# Clear Spotify Cache Files...
rm -rf "$HOME/Library/Application Support/Spotify/PersistentCache/Update/*.tbz"
rm -rf "$HOME/Library/Caches/com.spotify.client/Data"

# Clear Adobe Cache Files...
rm -rf "$HOME/Library/Application Support/Adobe/Common/Media Cache Files/*"

# Cleanup iOS Applications...
rm -rf "$HOME/Music/iTunes/iTunes Media/Mobile Applications/*"

# Remove iOS Device Backups...
rm -rf "$HOME/Library/Application Support/MobileSync/Backup/*"

# Cleanup XCode Derived Data and Archives...
rm -rf "$HOME/Library/Developer/Xcode/DerivedData/*"
rm -rf "$HOME/Library/Developer/Xcode/Archives/*"
