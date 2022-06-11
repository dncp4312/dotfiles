#!/bin/bash

max=$(cat /sys/class/backlight/amdgpu_bl0/max_brightness)
curr=$(cat /sys/class/backlight/amdgpu_bl0/actual_brightness)
div=$((max / 300 + curr / 5))
next=$((curr-div))
if [ $next -gt 0 ]; 
then
curr=$next
else
curr=0
fi
echo $curr  > /sys/class/backlight/amdgpu_bl0/brightness
