#!/bin/sh

monitor_num=`xrandr --listmonitors | sed -e "1d" | wc -l`
if [ $monitor_num -eq 2 ]; then
	primary_monitor=`xrandr --listmonitors | sed -e '1d' | head -n 1 | cut -d' ' -f 6`
	secondary_monitor=`xrandr --listmonitors | sed -e '1,2d' | head -n 1 | cut -d' ' -f 6`
	xrandr --output $primary_monitor --auto --primary --left-of $secondary_monitor
fi

