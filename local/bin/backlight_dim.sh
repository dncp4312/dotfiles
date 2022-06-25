#!/bin/bash

max=$(cat /sys/class/backlight/amdgpu_bl0/max_brightness)
curr=$(cat /sys/class/backlight/amdgpu_bl0/actual_brightness)
div=$((max / 255 + curr / 5))
next=$((curr-div))

[[ $next -gt 0 ]] && curr=$next || curr=0

echo $curr  > /sys/class/backlight/amdgpu_bl0/brightness
