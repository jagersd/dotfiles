#!/bin/bash

if [ `xrandr | grep DP-1-1 | grep -c ' connected'` -eq 1 ]; then
xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-1-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1-2 --mode 1920x1080 --pos 3840x0 --rotate normal --output DP-1-3 --off
else 
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
fi
