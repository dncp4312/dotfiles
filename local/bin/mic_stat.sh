#!/bin/sh

# [[ $(cat ~/Arch/Envy/mic_led) == '0' ]] && echo  || echo -e "\033[0;31m"
[[ $(cat ~/Arch/Envy/mic_led) == '0' ]] && echo  || echo "%{F#f00}%{F-}"
