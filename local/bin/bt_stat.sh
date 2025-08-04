#!/bin/env bash

# bluetoothctl info | grep -q 'Connected: yes' && echo "" || echo ""

case $(bluetoothctl devices Connected | grep '^Device' | wc -l) in
  ''|0) echo "" ;;
  1)    bluetoothctl devices Connected | grep -iq "keychron" && echo " " || echo "" ;;
  *)    echo "" ;;
esac

