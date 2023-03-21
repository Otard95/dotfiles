#!/bin/bash

/home/otard/.screenlayout/work.sh &
# /home/otard/.screenlayout/home.sh &
picom -b --experimental-backends --backend glx &
nitrogen --restore &
betterlockscreen -u /usr/share/ukui-greeter/images/wp_blurred.jpg &
emote &

# Turn off system bell
set bell-style none &
xset b off &

