#!/bin/sh
current_workspace=`i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d\" -f2`
another_workspace=`i3-msg -t get_workspaces | jq '.[] | select(.visible==true).name' | cut -d\" -f2 | sed -e "/$current_workspace/d"`
echo $another_workspace
workspace_size=5

if [ $current_workspace -le $workspace_size ]; then
	echo
else
	i3-msg workspace $another_workspace
fi

