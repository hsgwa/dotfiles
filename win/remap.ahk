<^a::Send,{Home}
<^e::Send,{End}
<^[::Send,{Esc}
<^Space::Send,{vkF4sc029}

<!h::Send,{left}
<!j::Send,{down}
<!k::Send,{up}
<!l::Send,{right}

#IF NOT WinActive("ahk_exe chrome.exe")
   >^W::Send, !{F4}
#IF