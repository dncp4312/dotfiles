#!/bin/sh

DEVICES=('ELAN2513:00 04F3:2DDE' 'SYNA32A0:00 06CB:CE14 Mouse' 'SYNA32A0:00 06CB:CE14 Touchpad' 'ELAN2513:00 04F3:2DDE Stylus Pen (0)' 'ELAN2513:00 04F3:2DDE Stylus Eraser (0)')

case "$1" in
'normal')   mat=(1  0 0  0  1 0 0 0 1) ;;
'left')     mat=(0 -1 1  1  0 0 0 0 1) ;;
'right')    mat=(0  1 0 -1  0 1 0 0 1) ;;
'inverted') mat=(-1 0 1  0 -1 1 0 0 1) ;;
*)
    echo "Invalid rotation: $1"
    exit 1
esac

xrandr --output eDP-1 --rotate $1
bspc wm -r

for dev in "${DEVICES[@]}"; do
    xinput set-prop "${dev}" 'Coordinate Transformation Matrix' "${mat[@]}"
done
