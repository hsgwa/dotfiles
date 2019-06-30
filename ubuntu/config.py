import re
from xkeysnail.transform import *

define_modmap({
	Key.LEFT_META: Key.RIGHT_CTRL,
	Key.LEFT_CTRL: Key.LEFT_META,
	Key.RIGHT_META: Key.RIGHT_CTRL,
	Key.RIGHT_CTRL: Key.RIGHT_META,
})

define_keymap(None, {
	K("Alt-h"): K("LEFT"),
	K("Alt-j"): K("DOWN"),
	K("Alt-k"): K("UP"),
	K("Alt-l"): K("RIGHT"),
}, "Default")

define_keymap(re.compile("Gnome-terminal"), {
}, "Terminal")

define_keymap(re.compile("Google-chrome"), {
	K("Super-i"): K("Ctrl-PAGE_DOWN"),
	K("Super-u"): K("Ctrl-PAGE_UP"),
	K("Shift-Super-i"): K("Ctrl-Shift-PAGE_DOWN"),
	K("Super-Shift-u"): K("Ctrl-Shift-PAGE_UP"),
}, "Chrome")

