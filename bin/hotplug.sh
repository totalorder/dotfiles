#!/bin/bash
echo "Action: $ACTION, hotplug: $HOTPLUG" >> /home/totalorder/hotplug.log

dmode="$(cat /sys/class/drm/card0/card0-DP-4/status)"
export DISPLAY=":0"
#export XAUTHORITY="/home/totalorder/.Xauthority"
export XAUTHORITY="/run/user/1000/gdm/Xauthority"
#export XAUTHORITY=/home/yourusername/.Xauthority

if [ "${dmode}" = connected ];then
     echo "Connected" >> /home/totalorder/hotplug.log
     #/usr/bin/xrandr --output HDMI-2 --right-of eDP-1 --auto --output DP-1-1 --right-of HDMI-2 --auto 
else 
     echo "Disconnected" >> /home/totalorder/hotplug.log
     /usr/bin/xrandr --output HDMI-2 --off --output DP-1-2 --off --output eDP-1 --primary --auto >> /home/totalorder/hotplug.log 2>&1
     #/usr/bin/xrandr --output HDMI-2 --off --output DP-1-1 --off
fi
