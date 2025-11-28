#!/bin/sh
# set -x # logs everything executed

# xset s off xset s noblank
xset -dpms

sudo -E makima &
# (sudo -E makima) > ~/makima.log 2>&1 &

unclutter &

# kitty &

$NH_FLAKE/scripts/yt-leanback-ui.sh &

exec matchbox-window-manager
