#!/bin/bash

max=$(cat /sys/class/backlight/amdgpu_bl1/max_brightness)
curr=$(cat /sys/class/backlight/amdgpu_bl1/brightness)
div=$((max / 255 + curr / 5))
next=$((curr+div))

[[ $next -lt $max ]] && curr=$next || curr=$max

echo $curr > /sys/class/backlight/amdgpu_bl1/brightness
