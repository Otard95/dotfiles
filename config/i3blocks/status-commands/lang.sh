#!/bin/bash

lang=$(setxkbmap -query | awk '/layout/{print $2}')

echo "$_left<span background=\"$_color\"> $lang</span>$_right"
echo "$_left<span background=\"$_color\"> $lang</span>$_right"
