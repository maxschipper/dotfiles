#!/bin/sh
# set -x # logs everything executed

# xset s off xset s noblank
xset -dpms

mkfifo /tmp/xob.pipe
tail -f /tmp/xob.pipe | xob &

sudo -E MAKIMA_CONFIG=/etc/makima makima &
# sudo -E makima &
# (sudo -E makima) > ~/makima.log 2>&1 &

unclutter &

# kitty &

$NH_FLAKE/scripts/yt-leanback-ui.sh &

xdotool mousemove 0 0
exec matchbox-window-manager
