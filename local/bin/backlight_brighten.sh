#!/bin/bash

max=$(cat /sys/class/backlight/amdgpu_bl0/max_brightness)
curr=$(cat /sys/class/backlight/amdgpu_bl0/actual_brightness)
div=$((max / 255 + curr / 5))
next=$((curr+div))

[[ $next -lt $max ]] && curr=$next || curr=$max

echo $curr  > /sys/class/backlight/amdgpu_bl0/brightness
