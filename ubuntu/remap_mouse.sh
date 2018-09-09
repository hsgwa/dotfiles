#!/bin/sh

DISPLAY=":0.0"
USER="hasegawa" # ユーザー名に変更する
HOME=/home/$USER/
export HOME DISPLAY
DEVICE_NAME="Kensington Expert Wireless TB"

for i in `seq 0 9`
do
        if /usr/bin/xinput list | grep -q "$DEVICE_NAME"; then
                /usr/bin/xinput set-button-map "$DEVICE_NAME" 3 3 1 4 5 6 7 1
                break
        fi
        sleep 1
done
