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
code --install-extension Shan.code-settings-sync

sudo apt install -y ranger
rm -rf ~/.config/ranger && ln -sf ~/dotfiles/ranger ~/.config/ranger
sudo apt install -y highlight lynx elinks poppler-utils mediainfo
sudo apt install -y atool bzip2 cpio gzip lhasa lzma lzop p7zip tar unace unrar zip unzip
sudo apt install -y ffmpegthumbnailer

sudo apt install -y vim-gnome
ln -sf ~/dotfiles/.vimrc ~/.vimrc

sudo apt install -y tmux
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# ウインドウマネージャをi3-wmに変更
sudo apt install -y i3-wm
sudo apt install -y i3status
sudo apt install -y dmenu
sudo apt install -y xsel
sudo apt install -y jq

# nautilusでデスクトップウインドウを非表示にする
gsettings set org.gnome.desktop.background show-desktop-icons false
rm -rf ~/.config/i3 && ln -sf ~/dotfiles/i3 ~/.config/i3

sudo apt install -y nkf
sudo apt install -y manpages-ja manpages-ja-dev

sudo apt -y autoremove

# xkey-snail
sudo apt install -y python3-pip
sudo pip3 install xkeysnail

sudo mkdir -p /etc/opt/xkeysnail
sudo cp ~/dotfiles/ubuntu/config.py /etc/opt/xkeysnail

mkdir ~/.config/systemd/users
cp ~/dotfiles/ubuntu/xkeysnail.service ~/.config/systemd/user/

systemctl --user enable xkeysnail
systemctl --user start xkeysnail
systemctl --user status xkeysnail

sudo apt install -y feh
sudo apt install -y blueman
sudo apt install -y pulseaudio-*
sudo apt install pulseaudio-module-bluetooth
sudo apt install pavucontrol
