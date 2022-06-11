#!/bin/sh

if [ $(bluetoothctl info | grep 'Device' | wc -c) -eq 0 ]
then
    bluetoothctl power on && bluetoothctl connect 8C:64:A2:61:CB:FC
else
    bluetoothctl power off
fi
