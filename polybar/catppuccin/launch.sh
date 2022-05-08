#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch

MONITORPRIMARY="$(xrandr --query | grep " primary" | cut -d" " -f1)";

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ "$MONITORPRIMARY" = "$m" ]; then
        MONITOR=$m polybar --config=~/.config/polybar/catppuccin/config  --reload catppuccin &
    else
        MONITOR=$m polybar --config=~/.config/polybar/catppuccin/config  --reload others &
    fi
  done
else
  polybar --config=~/.config/polybar/catppuccin/config --reload catppuccin &
fi
