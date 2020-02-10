#!/bin/sh

ps aux | grep xkeysnail | grep -v grep | grep -v $0 | perl -pe 's/ +/ /g' | cut -d' ' -f 2 | xargs -I@ sudo kill @
systemctl --user restart xkeysnail
