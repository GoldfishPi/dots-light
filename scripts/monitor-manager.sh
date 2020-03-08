#!/bin/bash

connected=`xrandr | grep " connected " | awk '{ print$1 }' | grep -v "eDP-1"` 
hdmi="DP-1"

echo "connected devices $connected"

if [ -z $connected ]; then
	xrandr --output eDP-1 --primary
	xrandr --output eDP-1 --auto
	echo "no devices connected"
else
	xrandr --output "$connected" --primary
	xrandr --output eDP-1 --off
	echo "$connected connected!"
fi

# xrandr --output HDMI-1 --primary
