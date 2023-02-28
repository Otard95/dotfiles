
PID=$(ps ux | grep 'kitty --class quake' | grep -v 'grep' | grep -v 'bin' | awk '{print $2}')

if [ -z "$PID" ]; then
  kitty --class quake
  exit 0
fi

winid=$(xdotool search -class quake)

if [ -n "$(xdotool search -classname quake)" ]; then
  xdotool set_window --classname hidden $winid
  i3-msg '[class="^quake$"] focus'
  i3-msg 'move scratchpad'
else
  xdotool set_window --classname quake $winid
  i3-msg '[class="^quake$"] focus'
  i3-msg 'resize set 80ppt 75ppt'
  i3-msg 'move position center'
fi

