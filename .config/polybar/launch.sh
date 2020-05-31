#!/usr/bin/env sh

BAR1=main

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
#polybar main -c $HOME/.config/polybar/config.ini &

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload "$BAR1" &
  done
else
  polybar --reload "$BAR1" &
fi
