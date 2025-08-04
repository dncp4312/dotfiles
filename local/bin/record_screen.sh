#!/usr/bin/env bash
W=1920
H=1080
X=0
Y=0

if [[ "$1" == "--select" || "$1" == "-s" ]]; then
  if command -v slop >/dev/null 2>&1; then
    read -r W H X Y <<<"$(slop -f '%w %h %x %y')"
  else
    echo "slop not found, using default region" >&2
  fi
else
    mons=($(bspc query -M --names))
    if ((${#mons[@]} > 1)); then
	mon="$(printf '%s\n' "${mons[@]}" | rofi -dmenu -p 'Select Monitor' -theme-str 'window { width: 30%; }')"
    else
	mon="${mons[0]}"
    fi
    read -r W H X Y < <(bspc query -T -m "$mon" | jq -r '.rectangle | "\(.width) \(.height) \(.x) \(.y)"')
fi

ffmpeg -f x11grab -framerate 60 -video_size "$W"x"$H" -i :0.0+"$X","$Y" ~/Videos/Captures/screen_$(date +%F_%H%M%S).mp4
