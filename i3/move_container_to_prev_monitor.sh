#!/bin/sh
current_monitor=`i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d\" -f2`
another_monitor=`i3-msg -t get_workspaces | jq '.[] | select(.visible==true and .focused==false).name' | cut -d\" -f2 | sed -e "/$current_monitor\$/d"`

if [ $current_monitor -le $another_monitor ]; then
	echo
else
	i3-msg move container to workspace $another_monitor
	i3-msg workspace $another_monitor
fi