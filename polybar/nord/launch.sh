#!/usr/bin/env sh

configDir=~/.config/polybar/nord/config

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch

MONITORPRIMARY="$(xrandr --query | grep " primary" | cut -d" " -f1)";

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ "$MONITORPRIMARY" = "$m" ]; then
        MONITOR=$m polybar --config=$configDir  --reload nord &
    else
        MONITOR=$m polybar --config=$configDir  --reload others &
    fi
  done
else
  polybar --config=$configDir --reload materia &
fi

