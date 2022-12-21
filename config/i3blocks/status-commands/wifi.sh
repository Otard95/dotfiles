#!/bin/bash

status=$(nmcli -c no device wifi | grep '*')

if [[ -z "$status" ]]; then
  echo "$_left<span background=\"$_color\"> Not Connected</span>$_right"
  echo "$_left<span background=\"$_color\"></span>$_right"
  echo "#aaaaaa"
  exit 0
fi

signal=$(awk '{print $8}' <<< "$status")
ssid=$(awk '{print $3}' <<< "$status")

echo "$_left<span background=\"$_color\">  $signal% $ssid</span>$_right"
echo "$_left<span background=\"$_color\">  $signal%</span>$_right"

[ $signal -le 10 ] exit 33

if [ $signal -le 30 ]; then
  echo "#ff9321"
elif [ $signal -lt 50 ]; then
  echo "#ffeb11"
elif [ $signal -lt 75 ]; then
  echo "#02aef2"
else
  echo "#14e002"
fi
