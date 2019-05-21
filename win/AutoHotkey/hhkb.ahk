>^Space::Send,{vkF4sc029}

#IfWinActive ahk_class Chrome_WidgetWin_1
<^U::Send,^+{Tab}
<^I::Send,^{Tab}
#IF

<!H::Send,{Left}
<!J::Send,{Down}
<!K::Send,{Up}
<!L::Send,{Right}

#IF NOT WinActive("ahk_exe chrome.exe") AND NOT WinActive("ahk_exe ttermpro.exe") AND NOT WinActive("ahk_exe thunderbird.exe") AND NOT WinActive("ahk_exe atom.exe") AND NOT WinActive("ahk_exe devenv.exe")
   >^W::Send, !{F4}
#IF

#IF WinActive("ahk_exe ttermpro.exe")
   <^U::Send,^bp
   <^I::Send,^bn
#IF

#IF WinActive("ahk_exe thunderbird.exe")
   <^U::Send,^+{Tab}
   <^I::Send,^{Tab}
#IF

#IF WinActive("ahk_exe devenv.exe")
   <^U::Send,^!{PgUp}
   <^I::Send,^!{PgDn}
   >^W::Send,^{F4}
#IF
