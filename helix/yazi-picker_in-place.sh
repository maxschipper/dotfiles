#!/usr/bin/env bash

#"YAZI_CONFIG_HOME=/Users/max/.config/yazelix/yazelix-yazi" "yazi"


# paths=$(YAZI_CONFIG_HOME=/Users/max/.config/yazi/helix-config/ yazi --chooser-file=/dev/stdout | while read -r; do printf "%q " "$REPLY"; done)
zellij action toggle-fullscreen

paths=$(yazi --chooser-file=/dev/stdout | while read -r; do printf "%q " "$REPLY"; done)

if [[ -n "$paths" ]]; then
	zellij action focus-previous-pane
	# zellij action write 27 # send <Escape> key # just put normal mode in binding
	zellij action write-chars ":$1 $paths"
	zellij action write 13 # send <Enter> key
fi
