import re
from xkeysnail.transform import *

define_modmap({
       Key.LEFT_META: Key.RIGHT_CTRL,
       Key.LEFT_CTRL: Key.LEFT_META,
       Key.RIGHT_META: Key.RIGHT_CTRL,
       Key.RIGHT_CTRL: Key.RIGHT_META,
       Key.HANJA: Key.RIGHT_CTRL,
       Key.HANGEUL: Key.RIGHT_CTRL,
       Key.YEN: Key.GRAVE,
})

define_keymap(None, {
	K("Alt-h"): K("LEFT"),
	K("Alt-j"): K("DOWN"),
	K("Alt-k"): K("UP"),
	K("Alt-l"): K("RIGHT"),
	K("Alt-n"): K("Shift-LEFT"),
	K("Alt-m"): K("Shift-DOWN"),
	K("Alt-COMMA"): K("Shift-UP"),
	K("Alt-DOT"): K("Shift-RIGHT"),
}, "Default")

define_keymap(re.compile("Gnome-terminal"), {
	K("Super-i"): [K("Ctrl-b"), K("n")],
	K("Super-u"): [K("Ctrl-b"), K("p")],
}, "Terminal")

define_keymap(re.compile("Google-chrome"), {
	K("Super-i"): K("Ctrl-PAGE_DOWN"),
	K("Super-u"): K("Ctrl-PAGE_UP"),
	K("Shift-Super-i"): K("Ctrl-Shift-PAGE_DOWN"),
	K("Super-Shift-u"): K("Ctrl-Shift-PAGE_UP"),
}, "Chrome")

