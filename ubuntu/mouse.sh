#!/bin/sh

MOUSE=`xinput --list --short|grep -i Kensington| cut -f 1|cut -d" " -f 5-|sed 's/\s\+$//g'
Kensington Expert Wireless TB`
xinput --set-prop "$MOUSE" "Device Accel Velocity Scaling" 1.5
xinput --set-prop "$MOUSE" "Device Accel Constant Deceleration" 1.5

