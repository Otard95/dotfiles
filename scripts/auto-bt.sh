#!/bin/bash

function usage {
  echo "Usage: auto-bt [OPTION] [...DEVICES]"
  echo ""
  echo "Connected to bluetooth DEVICES"
  echo "or interactively select a device"
  echo ""
  echo "Options:"
  echo "  -h, --help"
  echo "      Display this help message"
  echo "  -i, --interactive"
  echo "      Interactive mode, select and connect to device"
}

interactive=0
devices=""
while [ $# -gt 0 ]
do
  case $1 in
    -h|--help)
      usage
      exit 0
      ;;
    -i|--interactive)
      interactive=1
      ;;
    *)
      devices+=($1)
      ;;
  esac
  shift
done


DEVICES=( "Nothing ear (1)" "MX Master 2S" "WH-1000XM4" )
if [[ ${#devices[@]} -gt 0 ]]; then
  DEVICES=( "${devices[@]}" )
fi

function mac_by_name {
  bluetoothctl devices | grep "$1" | awk '{print $2}'
}

function connected {
    bluetoothctl info $1 | grep -q 'Connected: yes'
}

if [[ interactive -eq 1 ]]; then
  IFS=$'\n' read -rd '' -a available_devices <<<"$(bluetoothctl devices | grep 'Device' | awk '{$1 = ""; $2 = ""; print $0}' | sed 's/^\s*//')"

  echo "Select device:"
  for i in "${!available_devices[@]}"; do
    echo "$i) ${available_devices[$i]}"
  done
  read -p "Enter device number: " device
  DEVICES=( "${available_devices[$device]}" )
fi


function connect {
  TRIES=0
  MAC=$(mac_by_name "$1")
  echo "Connecting to '$1' ($MAC)"
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

