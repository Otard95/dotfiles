#!/bin/bash

status=$(nmcli d | grep 'ethernet' | grep -v 'unmanaged' | awk '{print $3}')

if [[ "$status" != "connected" ]]; then
  echo "$_left<span background=\"$_color\">󰈂 Disconnected</span>$_right"
  echo "$_left<span background=\"$_color\">󰈂</span>$_right"
  echo "#aaaaaa"
  exit 0
fi

echo "$_left<span background=\"$_color\">󰈁  Connected</span>$_right"
echo "$_left<span background=\"$_color\">󰈁</span>$_right"
echo "#14e002"
