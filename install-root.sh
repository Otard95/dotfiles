#!/bin/bash

DIRNAME=$(dirname $0 | xargs realpath)

update_file() {
  if [[ -f $1 ]]; then
    sudo mv $1 $1.$(date +%s).BAK
    sudo cp $2 $1
    echo "Update: $1 <- $2"
  else
    sudo cp $2 $1
    echo "Create: $1 <- $2"
  fi
}

update_file /etc/lightdm/lightdm.conf $DIRNAME/root/lightdm.conf
update_file /etc/lightdm/ukui-greeter.conf $DIRNAME/root/ukui-greeter.conf
update_file /usr/share/ukui-greeter/images/wp_blurred.jpg $DIRNAME/root/wp_blurred.jpg
update_file /etc/udev/rules.d/70-user.i3blocks.usb.rules $DIRNAME/root/70-user.i3blocks.usb.rules
update_file /etc/modprobe.d/nvidia-drm-modeset.conf $DIRNAME/root/nvidia-drm-modeset.conf

