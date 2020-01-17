#!/bin/sh

ps aux | grep xkeysnail | grep -v grep | awk '{ print "sudo kill -9", $2 }' | sh
systemctl --user restart xkeysnail
