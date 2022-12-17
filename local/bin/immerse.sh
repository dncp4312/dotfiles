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
    rm /tmp/immersed
    bspc wm -r
    picom &
    bspc query -D --names | xargs -I {} bspc desktop {} -l tiled
    bspc desktop firefox -l monocle
fi
