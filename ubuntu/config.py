import re
from xkeysnail.transform import *

define_keymap(None, {
	K("Alt-h"): K("LEFT"),
	K("Alt-j"): K("DOWN"),
	K("Alt-k"): K("UP"),
	K("Alt-l"): K("RIGHT"),
	K("Alt-n"): K("Shift-LEFT"),
	K("Alt-m"): K("Shift-DOWN"),
	K("Alt-COMMA"): K("Shift-UP"),
	K("Alt-DOT"): K("Shift-RIGHT"),
	K("Alt-u"): K("PAGE_DOWN"),
	K("Alt-i"): K("PAGE_UP"),
	K("Alt-KEY_1"): K("F1"),
	K("Alt-KEY_2"): K("F2"),
	K("Alt-KEY_3"): K("F3"),
	K("Alt-KEY_4"): K("F4"),
	K("Alt-KEY_5"): K("F5"),
	K("Alt-KEY_6"): K("F6"),
	K("Alt-KEY_7"): K("F7"),
	K("Alt-KEY_8"): K("F8"),
	K("Alt-KEY_9"): K("F9"),
	K("Alt-KEY_0"): K("F10"),
	K("Alt-GRAVE"): K("DELETE"),
}, "Default")

define_keymap(re.compile("Gnome-terminal"), {
	K("Super-i"): [K("Ctrl-b"), K("n")],
	K("Super-u"): [K("Ctrl-b"), K("p")],
	K("Shift-Super-i"): [K("Ctrl-b"), K("g")],
	K("Shift-Super-u"): [K("Ctrl-b"), K("v")],
}, "Terminal")

define_keymap(re.compile("Google-chrome"), {
	K("Super-i"): K("Ctrl-PAGE_DOWN"),
	K("Super-u"): K("Ctrl-PAGE_UP"),
	K("Shift-Super-i"): K("Ctrl-Shift-PAGE_DOWN"),
	K("Super-Shift-u"): K("Ctrl-Shift-PAGE_UP"),
}, "Chrome")

define_keymap(re.compile("Thunderbird"), {
	K("Super-i"): K("Ctrl-PAGE_DOWN"),
	K("Super-u"): K("Ctrl-PAGE_UP"),
	K("Shift-Super-i"): K("Ctrl-Shift-PAGE_DOWN"),
	K("Super-Shift-u"): K("Ctrl-Shift-PAGE_UP"),
}, "Thunderbird")
