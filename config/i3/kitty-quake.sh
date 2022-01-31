
PID=$(ps ux | grep 'kitty --class quake' | grep -v 'grep' | grep -v 'bin' | awk '{print $2}')

if [ -z "$PID" ]; then
  kitty --class quake
else
  kill $PID
fi


