#!/bin/sh

monitor_num=`xrandr --listmonitors | sed -e "1d" | wc -l`
if [ $monitor_num -eq 2 ]; then
	primary_monitor=`xrandr --listmonitors | sed -e '1d' | head -n 1 | cut -d' ' -f 6`
	secondary_monitor=`xrandr --listmonitors | sed -e '1,2d' | head -n 1 | cut -d' ' -f 6`

	primary_monitor_rotation_file=~/.primary_monitor_left_rotation
	if [ -e $primary_monitor_rotation_file ]; then
		xrandr --output $primary_monitor --rotate normal --auto
		rm $primary_monitor_rotation_file
	else
		xrandr --output $primary_monitor --rotate left --auto
		touch $primary_monitor_rotation_file
	fi
fi



