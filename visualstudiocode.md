# visual studio code 文档
## welcome tips
快速打开 `C+o  C+Tab`
命令面板 `C+S+p`

## 快捷键修改
File->Preferences->Keyoard Shortcuts
它会打开默认绑定和用户设定， 照着修改就行了， 下面是一些设定， （把 ctrl+d  ctrl+up ctrl+down 它们原来的功能与现在的交换了）

	// Place your key bindings in this file to overwrite the defaults
	[

	{ "key": "ctrl+d",          "command": "editor.action.deleteLines",
	                                     "when": "editorTextFocus" },
	{ "key": "ctrl+shift+k",                "command": "editor.action.addSelectionToNextFindMatch",
	                                     "when": "editorFocus" },
	{ "key": "ctrl+down",        "command": "editor.action.copyLinesDownAction",
	                                     "when": "editorTextFocus" },
	{ "key": "ctrl+up",          "command": "editor.action.copyLinesUpAction",
	                                     "when": "editorTextFocus" },
	{ "key": "shift+alt+up",             "command": "scrollLineDown",
	                                     "when": "editorTextFocus" },
	{ "key": "shift+alt+down",               "command": "scrollLineUp",
	                                     "when": "editorTextFocus" },
	{ "key": "shift+enter",            "command": "editor.action.insertLineAfter",
	                                     "when": "editorTextFocus" },
	{ "key": "ctrl+j",            "command": "editor.action.joinLines",
	                                     "when": "editorTextFocus" },
	{ "key": "alt+h",           "command": "workbench.action.previousEditor" },
	{ "key": "alt+l",         "command": "workbench.action.nextEditor" }
	]
