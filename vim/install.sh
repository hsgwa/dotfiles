mkdir -p ~/.config/nvim
cd ~/.config/nvim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
ln -s ~/dotfiles/vim/init.vim ~/.config/nvim/
