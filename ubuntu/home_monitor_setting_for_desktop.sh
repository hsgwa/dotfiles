#!/bin/sh
cd `dirname $0`

xrandr --output DVI-I-1 --auto
xrandr --output DP-0 --auto --right-of DVI-I-1

sh ./reload_wallpaper.sh
