#!/bin/zsh

walls=$(find ~/Pictures/Wallpapers/ -mindepth 1 -type d | rg -v Live | sort | awk -F/ '{print $NF}')

choice=$(echo $walls | rofi -dmenu -no-show-icons -l 2 -i -p "Wallpapers")
location=$(find ~/Pictures/Wallpapers -type d | rg $choice$)

feh --bg-fill --randomize --no-fehbg $location

