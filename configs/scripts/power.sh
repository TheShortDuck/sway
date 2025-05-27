#!/bin/bash

# Simple script to handle a DIY shutdown menu. When run you should see a bunch of options (shutdown, reboot etc.)
#
# Requirements:
# - rofi
# - systemd, but you can replace the commands for OpenRC or anything else
#
# Instructions:
# - Save this file as power.sh or anything
# - Give it exec priviledge, or chmod +x /path/to/power.sh
# - Run it

chosen=$(printf "Power Off\nRestart\nLock\nLog Out" | rofi -dmenu -i)

case "$chosen" in 
	"Power Off") poweroff ;;
	"Restart") reboot ;;
	"Lock") swaylock -f -c 000000 ;;
	"Log Out") swaymsg exit ;;
	*) exit 1 ;;
esac

