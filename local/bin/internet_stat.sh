#!/bin/sh

ping -c 1 1.1.1.1 > /dev/null 2>&1

[[ $? -eq 0 ]] && echo ' ' || echo "%{F#000} %{F-}"
