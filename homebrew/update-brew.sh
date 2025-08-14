#!/bin/sh

# Path to the timestamp file
TS_FILE="$HOME/.config/homebrew/last_brew_update"

# Clear the terminal
clear

# Run fastfetch
fastfetch

# Update Homebrew
brew update && brew upgrade

# Save current timestamp
date +%s > "$TS_FILE"
