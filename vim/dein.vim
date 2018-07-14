if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 if !has('nvim')
   call dein#add('christoomey/vim-tmux-navigator')
 endif

 call dein#end()
 call dein#save_state()
endif
filetype plugin indent on
