#!/usr/bin/env bash
# read -r W H X Y <<<"$(slop -f "%w %h %x %y")"
W=1920
H=1080
X=0
Y=0

ffmpeg -f x11grab -framerate 60 -video_size "$W"x"$H" -i :0.0+"$X","$Y" ~/Videos/Captures/screen_$(date +%F_%H%M%S).mp4
