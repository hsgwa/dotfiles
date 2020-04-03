#!/bin/bash

create_app_alias () {
	echo $1
	echo "
#!/bin/bash
[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=Switch to $1
Exec=/home/hasegawa/dotfiles/i3/move_to_app.sh $1
	" > ~/.local/share/applications/switch_to_$1.desktop
}
remove_app_alias () {
	rm ~/.local/share/applications/switch_to_$1.desktop
}

apps=`i3-msg -t get_tree | jq '.nodes[].nodes[].nodes[].nodes[].window_properties.class' | sort -u | cut -d'"' -f 2`

for app in $apps; do
	create_app_alias $app
done

i3-dmenu-desktop

for app in $apps; do
	remove_app_alias $app
done
