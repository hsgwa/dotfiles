#!/bin/sh

cd `dirname $0`

monitor_num=`xrandr --listmonitors | sed -e "1d" | wc -l`
if [ $monitor_num -eq 2 ]; then
	primary_monitor=`xrandr --listmonitors | sed -e '1d' | head -n 1 | cut -d' ' -f 6`
	secondary_monitor=`xrandr --listmonitors | sed -e '1,2d' | head -n 1 | cut -d' ' -f 6`

	secondary_monitor_rotation_file=~/.secondary_monitor_left_rotation
	if [ -e $secondary_monitor_rotation_file ]; then
		xrandr --output $secondary_monitor --rotate normal --auto
		rm $secondary_monitor_rotation_file
	else
		xrandr --output $secondary_monitor --rotate left --auto
		touch $secondary_monitor_rotation_file
	fi
fi

./reload_wallpaper.sh
