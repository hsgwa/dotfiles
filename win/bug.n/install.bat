echo off
rem ������
set USR_INPUT_STR=
rem ���͗v��
set /P USR_INPUT_STR="���[�U�[������͂��Ă�������: "
rem ���͒lecho

mklink C:\Users\%USR_INPUT_STR%\AppData\Roaming\bug.n\Config.ini C:\Users\%USR_INPUT_STR%\dotfiles\win\bug.n\Config.ini