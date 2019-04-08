echo off
rem 初期化
set USR_INPUT_STR=
rem 入力要求
set /P USR_INPUT_STR="ユーザー名を入力してください: "
rem 入力値echo

mklink C:\Users\%USR_INPUT_STR%\.vsvimrc C:\Users\%USR_INPUT_STR%\dotfiles\win\VisualStudio\.vsvimrc