#!/bin/bash

ACTION=$(system-power-dialog --size small | grep 'system-power-select::')

# Actions
#  - shutdown
#  - reboot
#  - lock
#  - logout
#  - hibernate
#  - sleep

if [[ $ACTION == "system-power-select::shutdown" ]]; then
    /sbin/shutdown -P now
elif [[ $ACTION == "system-power-select::reboot" ]]; then
    /sbin/shutdown -r now
elif [[ $ACTION == "system-power-select::lock" ]]; then
    xautolock -locknow
elif [[ $ACTION == "system-power-select::logout" ]]; then
    i3-msg exit
elif [[ $ACTION == "system-power-select::hibernate" ]]; then
    systemctl hibernate
elif [[ $ACTION == "system-power-select::sleep" ]]; then
    systemctl suspend
fi
