#!/bin/bash

if ! pidof -o %PPID -x "auto_rotate.sh" > /dev/null; then
    while IFS='$\n' read -r line; do
	rotation="$(echo $line | sed -En "s/^.*orientation changed: (.*)/\1/p")"
	case "$rotation" in
	    'normal')    rot='normal' ;;
	    'left-up')   rot='left' ;;
	    'right-up')  rot='right' ;;
	    'bottom-up') rot='inverted' ;;
	esac
	[[ !  -z  $rotation   ]] && rotate_screen.sh $rot
    done < <(stdbuf -oL monitor-sensor)
fi
