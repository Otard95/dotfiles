#!/bin/bash

SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR=$(cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

screen_hash="$(xrandr --listactivemonitors | sha256sum | awk '{print $1}')"
monitors_template="$screen_hash.monitors.conf"

echo "$monitors_template" > $DIR/../current.log

if [ ! -f $DIR/../$monitors_template ]; then
  cp $DIR/../template.conf $DIR/../$monitors_template
fi

echo "include $monitors_template" > $DIR/../monitors.conf
