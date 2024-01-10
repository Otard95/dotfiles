#!/bin/bash

setup_bg() {
  /home/otard/.config/nitrogen/scripts/set-rand > /dev/null
  xbgdump /tmp/lock-img.png > /dev/null
  betterlockscreen -u /tmp/lock-img.png --fx blur --blur 1 --span > /dev/null

  # nitrogen --restore &
  # betterlockscreen -u /usr/share/ukui-greeter/images/wp_blurred.jpg &
}

/home/otard/.screenlayout/work.sh &
# /home/otard/.screenlayout/home.sh &
picom -b --experimental-backends --backend glx &
# /home/otard/.config/nitrogen/scripts/set-rand
# xbgdump /tmp/lock-img.png
# betterlockscreen -u /tmp/lock-img.png --fx blur --blur 1 --span
setup_bg &
emote &

# Turn off system bell
set bell-style none &
xset b off &

