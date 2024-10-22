#!/bin/bash

setup_bg() {
  /home/otard/.config/i3/scripts/set-monitor-conf.sh > /dev/null
  /home/otard/.config/nitrogen/scripts/set-rand > /dev/null
  xbgdump /tmp/lock-img.png > /dev/null
  betterlockscreen -u /tmp/lock-img.png --fx blur --blur 2 --span > /dev/null
}

autorandr --change
# /home/otard/.config/arandr/init.sh &
setup_bg &

if [ -f /usr/src/i3-battery-popup/i3-battery-popup ]; then 
  nohup /usr/src/i3-battery-popup/i3-battery-popup -t 1m -n -I 2% -s /usr/src/i3-battery-popup/i3-battery-popup.wav > /dev/null &
fi

picom -b --experimental-backends --backend glx &

emote &

# Start ssh tunnel
ssh -fNTD 1337 otard@raspberrypi &

# Turn off system bell
set bell-style none &
xset b off &
