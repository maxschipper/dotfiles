#!/bin/sh

# if another screen is connected it will toggle the laptop screen on and off 

BUILTIN_DISPLAY_NAME="eDP-1"  # Get the name of your builtin display using "hyprctl monitors all"
DEFAULT_BUILTIN_ENABLE="$BUILTIN_DISPLAY_NAME, 2880x1800@120, 0x0, 2"

num_of_monitors=$(hyprctl monitors all | grep Monitor | wc -l)  # this might break in the feature or for different setups.
built_in_disabled=$(hyprctl monitors all -j | jq .[0].disabled)

if [[ $built_in_disabled = "false" ]]; then
    # echo "its on"
    if [[ $num_of_monitors -gt 1 ]]; then
        # disable builtin monitor
        hyprctl keyword monitor "$BUILTIN_DISPLAY_NAME, disable"
    else
        # re-enable builtin monitor
        hyprctl keyword monitor "$DEFAULT_BUILTIN_ENABLE"
    fi
else
    # echo "its off"
    hyprctl keyword monitor "$DEFAULT_BUILTIN_ENABLE"
fi

