#!/bin/sh
# モニター数に合わせてconfigを作り直して反映させる
# 
# echo ~/dotfiles/ubuntu/dual_monitor.sh > ~/.xprofile
# echo ~/dotfiles/i3/apply_local_config.sh >> ~/.xprofile
cd `dirname $0`


echo > ~/.config/i3/config

workspace_size=5

monitor_num=`i3-msg -t get_workspaces | jq '.[] | select(.visible==true).output' | wc -l`

primary_monitor=`i3-msg -t get_workspaces | jq '.[] | select(.visible==true).output'  | cut -d'"' -f2 | sed -e "2d"`
secondary_monitor=`i3-msg -t get_workspaces | jq '.[] | select(.visible==true).output'  | cut -d'"' -f2 | sed -e "1d"`

echo $monitor_num
echo $primary_monitor
echo $secondary_monitor

for i in `seq $monitor_num`; do
	workspace_offset=`echo $i - 1 | bc`
	workspace_offset=`echo $workspace_offset*5 | bc`

	for j in `seq 5`; do
		workspace_idx=`echo $workspace_offset + $j | bc`

		# primary monitor
		if [ $i -eq 1 ]; then
			echo workspace $workspace_idx output $primary_monitor >> ~/.config/i3/config
		elif  [ $i -eq 2 ]; then
			echo workspace $workspace_idx output $secondary_monitor >> ~/.config/i3/config
		fi
	done

done

cat config.base >> ~/.config/i3/config

i3-msg reload
