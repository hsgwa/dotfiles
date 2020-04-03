#!/bin/bash
cd `dirname $0`

app=$1
script_path=`readlink -f $0`
echo $script_path $* > /tmp/i3_last_move_to_app.sh && chmod +x /tmp/i3_last_move_to_app.sh


echo target app is $app
jq_args=".nodes[].nodes[].nodes[] | select(.nodes[].window_properties.class == $app) | .num"
app_workspaces=(`i3-msg -t get_tree | jq '.nodes[].nodes[].nodes[] | select(.nodes[].window_properties.class == "'$app'") | .num' | sort -u | xargs`)

is_app_workspace () {
	current_workspace=`i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d\" -f2`
	for app_workspace in $*; do
		if [[ $app_workspace -eq $current_workspace ]] ; then
			return 0
		fi
	done
	return 1
}
get_rotate_workspace () {
	current_workspace=`i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d\" -f2`
	
	app_workspaces=(`echo $* | xargs`)
	for (( i=0 ; i<$# ; i++ )) {
		if [ ${app_workspaces[i]} -eq $current_workspace ] ; then
			echo ${app_workspaces[i+1]}
			return ${app_workspaces[i+1]}
		fi
	}
}

next_workspace=${app_workspaces[0]}
if is_app_workspace ${app_workspaces[@]}; then
	get_rotate_workspace  ${app_workspaces[@]} ${app_workspaces[@]}
	next_workspace=$?
fi

echo next workspace is $next_workspace
i3-msg workspace $next_workspace
