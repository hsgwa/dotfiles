#!/bin/sh
cd `dirname $0`
sudo apt update
sudo apt upgrade

# HUDの無効化
sudo apt install -y compizconfig-settings-manager compiz-plugins-extra

# 輝度の調整
if [ "$(grep -r apandada1 /etc/apt/*)" = "" ]; then
	echo リポジトリ ppa:apandada1/brightness-controller が見つかりません。リポジトリの追加をします。
	sudo apt-add-repository ppa:apandada1/brightness-controller
	sudo apt update
else
	echo リポジトリ ppa:apandada1/brightness-controller が見つかりました。リポジトリの追加をスキップします。
fi

sudo apt install -y brightness-controller

sudo apt install -y ranger
rm -rf ~/.config/ranger && ln -sf ~/dotfiles/ranger ~/.config/ranger

sudo apt install -y vim-gnome
ln -sf ~/dotfiles/.vimrc ~/.vimrc

sudo apt install -y tmux
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

sudo apt -y autoremove
