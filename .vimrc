" 更新自動読み込み
set autoread
" 相対行表示
set relativenumber
" シンタックスハイライト機能をオン
syntax enable
set syntax=on
" 文字列検索で大文字小文字を区別しない
set ignorecase
" 検索文字に大文字が含まれる場合にignorecaseをOFFにする（大文字小文字を区別する）
set smartcase
" エンコーディングをutf8に設定
set encoding=utf8
" タブ幅の設定
set tabstop=4
" タブを挿入する時の幅を設定
set shiftwidth=4
" インクリメンタルサーチを有効にする
set incsearch
" マーカーを使用
set foldmethod=marker
" 新しい行のインデントを現在の行と同じにする
set autoindent
" 行番号を表示する
set number
" 閉じ括弧が入力された時，対応する括弧を強調する
set showmatch
" ハイライトを有効にする
set hlsearch
" バックアップファイルを作成しない
set nobackup
filetype on
" swapファイルを作成しない
set noswapfile
set clipboard=unnamedplus

nnoremap <ESC><ESC> :nohlsearch<CR>

" 検索語が画面の真ん中に来るようにする
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
