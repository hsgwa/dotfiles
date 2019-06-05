# dotfiles

ubuntu .bashrc追加分
```
eval `dircolors  /home/hasegawa/.dir_colors/dircolors` # solarized color theme  https://github.com/Anthony25/gnome-terminal-colors-solarize
source ~/p637_hnd/path_generation_ballbot/devel/setup.bash
source ~/catkin_ws/devel/setup.bash
# set prompt
## \[ ... \] : encloses control sequence with \[ and \] for accurate word wrap
## \033[xxm : changes the color of command line
## \h : the hostname up to the first "."
## \w : current working directory
## \n : newline
## \$ : "$" for non-root, "#" for root

export PS1='\n${debian_chroot:+($debian_chroot)}\u@\h:\w \n$ '
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
set -o vi
```
