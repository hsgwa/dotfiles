#!/bin/bash

for f in .??*
do
	[[ "$f" == ".git" ]] && continue
	[[ "$f" == ".DS_Store" ]] && continue


	rm ~/$f
	ln -s ~/dotfiles/$f ~/$f 2>/dev/null
done
