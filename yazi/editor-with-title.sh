#!/usr/bin/env bash


# sets the window title using xterm escape codes
function title {
  echo -en "\033]0;$@\a"
}

title $@
exec $EDITOR "$@"
