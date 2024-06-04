#!/usr/bin/env bash

polybar-msg cmd quit

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m HOSTCONFIG=$(hostname).ini polybar --reload example &
  done
else
  polybar --reload example &
fi
