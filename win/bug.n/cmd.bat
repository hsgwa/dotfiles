echo off
rem 初期化
set USR_INPUT_STR=
rem 入力要求
set /P USR_INPUT_STR="ユーザー名を入力してください: "
rem 入力値echo

mklink C:\Users\%USR_INPUT_STR%\AppData\Roaming\bug.n\Config.ini C:\Users\%USR_INPUT_STR%\dotfiles\win\bug.n\Config.ini