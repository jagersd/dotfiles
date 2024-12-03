#!/usr/bin/env bash

killall -q "waybar" && sleep 1;

if ! pgrep -x "waybar" > /dev/null; then
	waybar &
fi
