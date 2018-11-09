<^Space::Send,{vkF4sc029}

#IfWinActive ahk_class Chrome_WidgetWin_1
<^U::Send,^+{Tab}
<^I::Send,^{Tab}
#IF

<!H::Send,{Left}
<!J::Send,{Down}
<!K::Send,{Up}
<!L::Send,{Right}

#IF NOT WinActive("ahk_exe chrome.exe") AND NOT WinActive("ahk_exe ttermpro.exe")
   >^W::Send, !{F4}
#IF