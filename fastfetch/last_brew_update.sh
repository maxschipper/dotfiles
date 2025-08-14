#!/bin/sh

TS_FILE="$HOME/.config/homebrew/last_brew_update"

if [ ! -f "$TS_FILE" ]; then
    echo "Never"
    exit 0
fi

now=$(date +%s)
last=$(cat "$TS_FILE")
diff=$((now - last))

# Convert seconds to human-readable format
days=$((diff / 86400))
hours=$(( (diff % 86400) / 3600 ))
minutes=$(( (diff % 3600) / 60 ))

if [ "$days" -gt 0 ]; then
    echo "$days day(s), $hours hour(s) ago"
elif [ "$hours" -gt 0 ]; then
    echo "$hours hour(s), $minutes minute(s) ago"
else
    echo "$minutes minute(s) ago"
fi
