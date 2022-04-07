
PID=$(ps ux | grep 'kitty --class calculator' | grep -v 'grep' | grep -v 'bin' | awk '{print $2}')

if [ -z "$PID" ]; then
  kitty --class calculator '/home/otard/scripts/calc'
else
  kill $PID
fi


