#!/bin/bash

DEFAULT_SINK_NAME=`pactl info | sed -En 's/Default Sink: (.*)/\1/p'`
DEFAULT_SINK_ID=`pactl list sinks short | grep "bluez_sink.14_3F_A6_26_BF_F6.a2dp_sink" | cut -c 1`
IFS=$'\n'
SINK_LIST=(`pactl list sinks`)

FOUND=0
volume=""
muted=""
for line in "${!SINK_LIST[@]}"; do
  if [[ "${SINK_LIST[$line]}" == *"Sink #${DEFAULT_SINK_ID}"* ]]; then
    FOUND=1
  fi
  if [[ $FOUND -eq 1 ]]; then
    # Find volume
    if [[ "${SINK_LIST[$line]}" == *"Volume:"* ]] && [[ "${SINK_LIST[$line]}" != *"Base"* ]]; then
      volume=`echo "${SINK_LIST[$line]}" | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'`
    fi
    if [[ "${SINK_LIST[$line]}" == *"Mute:"* ]]; then
      muted=`echo "${SINK_LIST[$line]}" | sed -e 's|\s*\w*:\s*||g'`
    fi
  fi
done

if [[ "$muted" == *"yes"* ]]; then
  echo "$_left<span background=\"$_color\"> $volume</span>$_right"
elif [[ $volume -lt 30 ]]; then
  echo "$_left<span background=\"$_color\"> $volume</span>$_right"
elif [[ $volume -lt 60 ]]; then
  echo "$_left<span background=\"$_color\"> $volume</span>$_right"
else
  echo "$_left<span background=\"$_color\"> $volume</span>$_right"
fi
