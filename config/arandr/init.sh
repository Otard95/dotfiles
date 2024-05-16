#!/bin/bash

set -e

screen_layout_hash="$(xrandr --listactivemonitors | sha256sum | awk '{print $1}')"
screen_layout_file="$screen_layout_hash.sh"

echo "$screen_layout_hash" > $HOME/.screenlayout/current.log
if [ -f $HOME/.screenlayout/$screen_layout_file ]; then
  source "$HOME/.screenlayout/$screen_layout_file"
else
  echo '#!/bin/bash' > "$HOME/.screenlayout/$screen_layout_file"
  chmod 700 "$HOME/.screenlayout/$screen_layout_file"
fi
