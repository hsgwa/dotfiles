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

# Visual Studio Code のインストール
if [ "$(grep -r apandada1 /etc/apt/*)" = "" ]; then
	echo リポジトリ packages.microsoft.com/repos/vscode が見つかりません。リポジトリの追加をします。
	curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
	sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
	rm -f microsoft.gpg
	sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
	sudo apt-get update

	sudo apt-add-repository ppa:apandada1/brightness-controller
	sudo apt update

else
	echo リポジトリ packages.microsoft.com/repos/vscode が見つかりました。リポジトリの追加をスキップします。
fi
sudo apt-get install code


sudo apt install -y ranger
rm -rf ~/.config/ranger && ln -sf ~/dotfiles/ranger ~/.config/ranger

sudo apt install -y vim-gnome
ln -sf ~/dotfiles/.vimrc ~/.vimrc

sudo apt install -y tmux
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

sudo apt -y autoremove
