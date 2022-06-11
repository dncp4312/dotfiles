#!/bin/bash

max=$(cat /sys/class/backlight/amdgpu_bl0/max_brightness)
curr=$(cat /sys/class/backlight/amdgpu_bl0/actual_brightness)
div=$((max / 300 + curr / 5))
next=$((curr+div))
if [ $next -lt $max ]; 
then
curr=$next
else
curr=$max
fi
echo $curr  > /sys/class/backlight/amdgpu_bl0/brightness
