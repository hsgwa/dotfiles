<^Space::Send,{vkF4sc029}

<!H::Send,{Left}
<!J::Send,{Down}
<!K::Send,{Up}
<!L::Send,{Right}

#IF NOT WinActive("ahk_exe chrome.exe")
   >^W::Send, !{F4}
#IF