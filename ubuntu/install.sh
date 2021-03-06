#!/bin/sh
cd `dirname $0`
sudo apt update
sudo apt -y upgrade

# HUDの無効化
sudo apt install -y compizconfig-settings-manager compiz-plugins-extra

# 輝度の調整
if [ "$(grep -r apandada1/brightness-controller /etc/apt)" = "" ]; then
	echo リポジトリ apandada1/brightness-controller が見つかりません。リポジトリの追加をします。
	sudo apt-add-repository ppa:apandada1/brightness-controller
	sudo apt update
else
	echo リポジトリ apandada1/brightness-controller が見つかりました。リポジトリの追加をスキップします。
fi

sudo apt install -y brightness-controller
sudo apt install -y manpages-ja
sudo apt install -y curl
sudo apt install -y silversearcher-ag
sudo apt install -y global
sudo apt install -y clang-tools-8
sudo apt install -y mu4e
sudo apt install -y xinput
sudo apt install -y sqlite3
sudo apt install -y guile-2.2-dev html2text xdg-utils
sudo apt install -y libwebkitgtk-3.0-dev
sudo apt install -y offlineimap
sudo apt install -y notmuch
sudo apt install -y gnutls-bin
sudo apt install -y tig
# notmuch setup && notmuch new
sudo apt install -y sqlite3
sudo apt install -y emacs-mozc*
gem install taskjuggler

# Visual Studio Code のインストール
if [ "$(grep -r vscode /etc/apt)" = "" ]; then
	echo リポジトリ packages.microsoft.com/repos/vscode が見つかりません。リポジトリの追加をします。
	curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
	sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
	rm -f microsoft.gpg
	sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
	sudo apt-get update
else
	echo リポジトリ packages.microsoft.com/repos/vscode が見つかりました。リポジトリの追加をスキップします。
fi
sudo apt install -y code
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
sudo apt install -y fcitx-mozc
sudo apt install -y i3status
sudo apt install -y fcitx-mozc
sudo apt install -y dmenu
sudo apt install -y xsel
sudo apt install -y jq

# nautilusでデスクトップウインドウを非表示にする
gsettings set org.gnome.desktop.background show-desktop-icons false
rm -rf ~/.config/i3 && mkdir -p ~/.config/i3
sh ~/dotfiles/i3/apply_local_config.sh

sudo apt install -y nkf
sudo apt install -y manpages-ja manpages-ja-dev
sudo apt install -y tree
sudo apt install -y clang

sudo apt -y autoremove

# xkey-snail
sudo apt install -y python3-pip
sudo pip3 install xkeysnail

sudo mkdir -p /etc/opt/xkeysnail
sudo ln -sf ~/dotfiles/ubuntu/config.py /etc/opt/xkeysnail

mkdir -p ~/.config/systemd/user
sudo ln -sf ~/dotfiles/ubuntu/xkeysnail.service ~/.config/systemd/user/


systemctl --user enable xkeysnail
systemctl --user start xkeysnail

sudo apt install -y feh
sudo apt install -y blueman
sudo apt install -y pulseaudio-*
sudo apt install -y pulseaudio-module-bluetooth
sudo apt install -y pavucontrol

# spacemacs

# spacemacs のインストール
if [ "$(grep -r emacs /etc/apt)" = "" ]; then
	echo emacs が見つかりません。emacsのインストールをします。
	sudo add-apt-repository ppa:kelleyk/emacs
	sudo apt-get update
	sudo apt-get install emacs26
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
else
	echo emacs が見つかりました。emacsのインストールをスキップします。
fi

# # octave のインストール
# if [ "$(grep -r octave /etc/apt)" = "" ]; then
# 	echo リポジトリ /ppa.launchpad.net/octave/stable/ubuntu が見つかりません。リポジトリの追加をします。
# 	sudo add-apt-repository ppa:octave/stable
# else
# 	echo リポジトリ packages.microsoft.com/repos/vscode が見つかりました。リポジトリの追加をスキップします。
# fi
# sudo apt install -y octave
# sudo apt install -y liboctave-dev

# install Ricty Diminished
if [ "$(fc-list | grep "Ricty Diminished")" = "" ]; then
	sudo mkdir /usr/share/fonts/RictyDiminished/
	git clone https://github.com/edihbrandon/RictyDiminished
	cd RictyDiminished/
	sudo cp *.ttf /usr/share/fonts/RictyDiminished/
	sudo fc-cache -fv
	rm -rf RictyDiminished
else
	echo フォントRicty Diminished が見つかりました。フォントの追加をスキップします。
fi

# SimpleScreenRecorder のインストール
if [ "$(grep -r maarten-baert/simplescreenrecorder /etc/apt)" = "" ]; then
	echo リポジトリ maarten-baert/simplescreenrecorder が見つかりません。リポジトリの追加をします。
	sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder
	sudo apt-get update
else
	echo リポジトリ maarten-baert/simplescreenrecorder が見つかりました。リポジトリの追加をスキップします。
fi

# pecoのインストール
if [ -z `which peco` ]; then
	echo  "pecoをインストールします"
	cd /tmp
	sudo wget "https://github.com/peco/peco/releases/download/v0.5.3/peco_linux_386.tar.gz"
	sudo tar xzvf peco_linux_386.tar.gz
	cd peco_linux_386
	sudo chmod +x peco
	sudo cp peco /usr/local/bin
else
	echo "peco見つかりました。pecoのインストールをスキップします。"
fi

# docker のインストール
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
if [ "$(grep -r docker /etc/apt)" = "" ]; then
	echo リポジトリ docker が見つかりません。リポジトリの追加をします。
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	sudo apt update -y
	sudo apt install -y docker-ce
else
	echo リポジトリ maarten-baert/simplescreenrecorder が見つかりました。リポジトリの追加をスキップします。
fi


sudo apt install -y simplescreenrecorder
sudo apt install -y binutils-avr gcc-avr avr-libc avrdude
sudo apt install -y dfu-programmer

sudo apt install -y filezilla
sudo apt install -y inkscape
sudo apt install -y sxiv
sudo apt install -y tig, nfs-common
sudo apt install -y docker-compose
sudo apt install -y texlive-base texlive-latex-base dvipng texlive-latex-extra
sudo apt install -y cmigemo


ln -s ~/dotfiles/ubuntu/links/reload.desktop ~/.local/share/applications/reload.desktop
ln -s ~/dotfiles/ubuntu/links/deco.desktop ~/.local/share/applications/deco.desktop
ln -s ~/dotfiles/ubuntu/links/xmind.desktop ~/.local/share/applications/xmind.desktop

ln -s ~/dotfiles/ubuntu/nvim/ ~/.config/

if [ $(crontab -l | grep mouse.sh | wc -l ) -eq 0 ]; then
	echo mouse.shをcrontabへ追加します。
	echo "@reboot $(find ~/dotfiles/ -name mouse.sh | xargs -I@ readlink -f @)" | crontab
else
	echo mouse.shがcrontabに追加されています。処理をスキップします。
fi

echo  '{"env": "private"}' > ~/.emacs_setting

echo "Copy this setting to ~/.bashrc."
echo "-----------------"
echo "alias ranger='ranger --choosedir=\$HOME/.rangerdir; LASTDIR=\`cat \$HOME/.rangerdir\`; cd \$LASTDIR'"
echo alias s=\'sxiv -i \'
echo "set -o vi"
echo "export LANG=ja_JP.utf8"
## \[ ... \] : encloses control sequence with \[ and \] for accurate word wrap
## \033[xxm : changes the color of command line
## \h : the hostname up to the first "."
## \w : current working directory
## \n : newline
## \$ : "$" for non-root, "#" for root
echo "export PS1='\n${debian_chroot:+($debian_chroot)}\u@\h:\w \n$ '"

echo "-----------------"
