#!/usr/bin/env zsh

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

layout_file="${XDG_CACHE_HOME:-$HOME/.cache}/bspwm-monitor-layout"
layout=$(<"$layout_file" 2>/dev/null)
# [[ -z "$layout" ]] && layout="h"

monitors=("${(@f)$(active_monitors)}")

if [[ "$layout" == "h" && ${#monitors[@]} -eq 2 ]]; then
  MONITOR="${monitors[1]}" polybar --reload left &
  MONITOR="${monitors[2]}" polybar --reload right &
else
  for m in $monitors; do
    MONITOR="$m" polybar --reload main &
  done
fi
