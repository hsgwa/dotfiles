#!/bin/sh
current_monitor=`i3-msg -t get_workspaces | jq '.[] | select(.focused==true).output'`
current_workspace=`i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d\" -f2`
workspace_size=5

if [ $current_workspace -le $workspace_size ]; then
	next_workspace=`echo \( $current_workspace - 1 + $workspace_size \) % $workspace_size | bc`
	if [ $next_workspace -eq 0 ]; then
		next_workspace=`echo $workspace_size + $next_workspace | bc`
	fi
	i3-msg workspace $next_workspace
else
	next_workspace=`echo \( $current_workspace - 1 + $workspace_size \) % $workspace_size | bc`

	next_workspace=`echo \( $current_workspace - 1 + $workspace_size \) % $workspace_size | bc`
	if [ $next_workspace -eq 0 ]; then
		next_workspace=`echo $workspace_size + $next_workspace | bc`
	fi
	next_workspace=`echo $workspace_size + $next_workspace | bc`

	i3-msg workspace $next_workspace
fi

