#!/bin/sh
current_workspace=`i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d\" -f2`
workspace_size=5

if [ $current_workspace -le $workspace_size ]; then
	next_workspace=`echo $current_workspace % $workspace_size + 1 | bc`
	i3-msg move container to workspace $next_workspace
	# i3-msg workspace $next_workspace
else
	next_workspace=`echo $current_workspace % $workspace_size + 1 + $workspace_size| bc`
	i3-msg move container to workspace $next_workspace
	# i3-msg workspace $next_workspace
fi

