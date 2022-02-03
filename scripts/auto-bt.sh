#!/bin/bash

DEVICES=( "Nothing ear (1)" "MX Master 2S" "WH-1000XM4" )
if [[ $# -gt 0 ]]; then
  DEVICES=( "$@" )
fi

function mac_by_name {
  bluetoothctl devices | grep "$1" | awk '{print $2}'
}

function connected {
    bluetoothctl info $1 | grep -q 'Connected: yes'
}

function connect {
  TRIES=0
  MAC=$(mac_by_name "$1")
  while :; do
    if connected "$MAC" ; then
      echo "$1 - already connected"
      return 0
    else
      bluetoothctl connect ${MAC} > /dev/null
      if connected "$MAC" ; then
        echo "$1 - Connected"
        return 0
      else
        ((TRIES++))
        if [[ TRIES -gt 3 ]]; then
          echo "$1 - Connection failed."
          return 1;
        fi
        echo "$1 - Connection failed. Retrying..."
        sleep 1
      fi
    fi
  done
}

for DEVICE in "${DEVICES[@]}"; do
  connect "${DEVICE}" &
done
wait

