#! /usr/bin/env fish

if test (count $argv) -eq 0
    echo "Error: No arguments provided." >&2
    exit 1
end

set TXT "$XDG_CONFIG_HOME/helix/compile-command.txt"

echo $argv >$TXT
cat $TXT
