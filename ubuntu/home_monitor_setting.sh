#!/bin/sh
xrandr --output DP-1 --auto
xrandr --output DVI-I-1-1 --auto --right-of DP-1

xrandr --output eDP-1 --off
sh ./reload_wallpaper.sh
