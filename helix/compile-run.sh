#! /usr/bin/env fish

# executes the command in compile-command.txt in the helix config dir
# set the command with compile-set.sh

if test (count $argv) -gt 0
    echo "Error:" (status filename) "doesnt take any arguments" >&2
    exit 1
end

set TXT "$XDG_CONFIG_HOME/helix/compile-command.txt"

set cmd (cat $TXT)

eval $cmd
