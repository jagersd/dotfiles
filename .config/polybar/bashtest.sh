#!/usr/bin/env sh

MONITORPRIMARY="$(xrandr --query | grep " primary" | cut -d" " -f1)";

echo $MONITORPRIMARY;

if type "xrandr"; then
  
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    echo $m;
    if [ "$MONITORPRIMARY" = "$m" ]; then
    echo "die zijn gelijkt";
    else
    echo "deze zijn ongelijk!";
    fi

  done
else
  echo "dit is een teststring";
fi
