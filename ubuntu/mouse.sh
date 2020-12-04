#!/bin/sh

OS_VERSION=`cat /etc/os-release | grep -i version_id | egrep -o "[0-9]+.[0-9]+"`

if [ $OS_VERSION = '20.04' ] ; then
	MOUSE=`xinput --list --short|grep -i "Expert Wireless TB" | cut -f 1|cut -d" " -f 5- |sed 's/\s\+$//g' | grep -e ^Expert -e ^Kensington`
	xinput set-prop "pointer:$MOUSE"  "libinput Accel Speed" -1.0
elif [ $OS_VERSION = '18.04' ] ; then
	MOUSE=`xinput --list --short|grep -i "Expert Wireless TB" | cut -f 1|cut -d" " -f 5- |sed 's/\s\+$//g' | grep -e ^Expert -e ^Kensington`
	# MOUSE=`xinput --list --short|grep -i Kensington| cut -f 1|cut -d" " -f 5-|sed 's/\s\+$//g' | grep ^Kensington # Kensington Expert Wireless TB`
	xinput --set-prop "pointer:$MOUSE"  "libinput Accel Speed" -1.0
else
	MOUSE=`xinput --list --short|grep -i Kensington| cut -f 1|cut -d" " -f 5-|sed 's/\s\+$//g' | grep ^Kensington # Kensington Expert Wireless TB`
	xinput --set-prop "$MOUSE" "Device Accel Velocity Scaling" 2.0
	xinput --set-prop "$MOUSE" "Device Accel Constant Deceleration" 3.5

	MOUSE=`xinput --list --short| grep -i bsmbb23s | cut -f 1 | cut -d' ' -f 5- | sed 's/\s\+$//g'`
	if [ $MOUSE ]; then
		xinput --set-prop "$MOUSE" "Device Accel Velocity Scaling" 2.0
		xinput --set-prop "$MOUSE" "Device Accel Constant Deceleration" 3.0
	fi
fi
