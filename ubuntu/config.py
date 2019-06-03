import re
from xkeysnail.transform import *

define_modmap({
	Key.LEFT_META: Key.RIGHT_CTRL,
	Key.LEFT_CTRL: Key.LEFT_META,
	Key.RIGHT_META: Key.RIGHT_CTRL,
	Key.RIGHT_CTRL: Key.RIGHT_META,
})
define_keymap(re.compile("Gnome-terminal"), {
	K("Super-i"): [K("Ctrl-b"), K("n"), K("Esc")],
	K("Super-u"): [K("Ctrl-b"), K("p"), K("Esc")],
	K("Alt-h"): [K("Ctrl-b"), K("h"), K("Esc")],
	K("Alt-j"): [K("Ctrl-b"), K("j"), K("Esc")],
	K("Alt-k"): [K("Ctrl-b"), K("k"), K("Esc")],
	K("Alt-l"): [K("Ctrl-b"), K("l"), K("Esc")],
}, "Terminal")

define_keymap(None, {
	K("Alt-h"): K("LEFT"),
	K("Alt-j"): K("DOWN"),
	K("Alt-k"): K("UP"),
	K("Alt-l"): K("RIGHT"),
	K("Super-y"): [K("Super-y"), K("Esc")],
	K("Super-o"): [K("Super-o"), K("Esc")],
	K("Super-h"): [K("Super-h"), K("Esc")],
	K("Super-j"): [K("Super-j"), K("Esc")],
	K("Super-k"): [K("Super-k"), K("Esc")],
	K("Super-l"): [K("Super-l"), K("Esc")],
}, "Default")

define_keymap(re.compile("Google-chrome"), {
	K("Super-i"): K("Ctrl-TAB"),
	K("Super-u"): K("Ctrl-Shift-TAB"),
}, "Chrome")

