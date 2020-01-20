#!/bin/sh

ps aux | grep xkeysnail | grep -v grep | perl -pe 's/ +/ /g' | cut -d' ' -f 2 | xargs -I@ sudo kill @
systemctl --user restart xkeysnail
