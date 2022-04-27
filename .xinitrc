#!/bin/bash

# autorandr -c
xrandr --output DP-0.8 --pos 0x330 --output DP-4 --pos 5120x0 --rotate right
xrandr --output DP-6 --pos 2560x330
picom -b &
nitrogen --restore &
betterlockscreen -u /usr/share/ukui-greeter/images/wp_blurred.jpg &
emote &

