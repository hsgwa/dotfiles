#!/usr/bin/env bash

if [ -x /usr/local/bin/xkeysnail ]; then
	USER=`whoami`
	xhost +SI:localuser:$(UESR)
	sudo -u $(USER) DISPLAY=:0 /usr/local/bin/xkeysnail /usr/local/etc/config.py &
fi
