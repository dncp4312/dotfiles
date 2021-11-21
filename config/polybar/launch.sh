#!/usr/bin/env bash

DIR="$HOME/.config/polybar/"

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if [ $(xrandr --query | grep " connected" | wc -l) -gt 1  ]; then
	  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		      #MONITOR=$m polybar --reload main &
		      MONITOR=HDMI-3 polybar --reload left &
		      MONITOR=DP-2 polybar --reload right &
			    done
else
	  polybar --reload main &
fi

