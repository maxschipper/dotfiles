#!/usr/bin/env fish

#"YAZI_CONFIG_HOME=/Users/max/.config/yazelix/yazelix-yazi" "yazi"


# paths=$(YAZI_CONFIG_HOME=/Users/max/.config/yazi/helix-config/ yazi --chooser-file=/dev/stdout | while read -r; do printf "%q " "$REPLY"; done)



# Retrieve paths selected by `yazi` and escape them
# set paths (env YAZI_CONFIG_HOME=/Users/max/.config/yazi/helix-config/ yazi --chooser-file=/dev/stdout | while read; begin printf "%q " $REPLY; end)
# set paths (yazi --chooser-file=/dev/stdout | while read; begin printf "%q " $REPLY; end)

# set paths (env YAZI_CONFIG_HOME=/Users/max/.config/yazi/helix-yazi_config/ yazi --chooser-file=/dev/stdout | while read
#     begin 
#         printf "%q " $REPLY
#     end
# end)
set paths (env YAZI_CONFIG_HOME=/Users/max/.config/yazi/helix-yazi_config/ yazi --chooser-file=/dev/stdout)


# Check if paths is not empty
if test -n "$paths"
    # zellij action toggle-floating-panes
    zellij action focus-previous-pane
    zellij action write 27 # send <Escape> key (use normal mode binding instead if configured)
    # zellij action write-chars ":$argv[1] $paths"
    zellij action write-chars ":open $paths"
    zellij action write 13 # send <Enter> key
else
    zellij action focus-previous-pane
end

fish /Users/max/.config/helix/yazi-picker.fish
