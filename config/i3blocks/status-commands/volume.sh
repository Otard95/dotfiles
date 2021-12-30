#!/bin/bash

SINK=`pactl list short | grep RUNNING | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,'`
volume="$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')"
muted="$(pactl list sinks | grep '^[[:space:]]Mute:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's|\s*\w*:\s*||g')"

# echo "$SINK $volume $muted"

if [[ $muted == "yes" ]]; then
  echo "$_left<span background=\"$_color\"> $volume</span>$_right"
elif [[ $volume -lt 30 ]]; then
  echo "$_left<span background=\"$_color\"> $volume</span>$_right"
elif [[ $volume -lt 60 ]]; then
  echo "$_left<span background=\"$_color\"> $volume</span>$_right"
else
  echo "$_left<span background=\"$_color\"> $volume</span>$_right"
fi
