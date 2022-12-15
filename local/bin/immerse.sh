#!/bin/bash

if ! [[ -f /tmp/immersed ]]; then
    border=2
    touch /tmp/immersed
    pkill polybar &
    pkill picom &
    bspc config window_gap 0
    bspc config border_width $border
    bspc config right_padding -$border
    bspc config left_padding -$border
    bspc config top_padding -$border
    bspc config bottom_padding -$border
    bspc query -D --names | xargs -I {} bspc desktop {} -l monocle
else
    bspc wm -r
    rm /tmp/immersed
    bspc query -D --names | xargs -I {} bspc desktop {} -l tiled
    bspc desktop firefox -l monocle
fi
    # border=4
    # launch_picom &
    # bspc config window_gap 6
    # bscp config border_width 4
    # bspc config right_padding 0
    # bspc config left_padding 0
    # bspc config top_padding 0
    # launch_polybar &
