  vim: ft=markdown

# sublime
## 中文输入法问题


http://www.sublimetext.com/forum/viewtopic.php?f=3&t=7006&start=10#p41343
## 安装插件
安装Sublime text 2插件很方便，可以直接下载安装包解压缩到Packages目录（菜单->preferences->packages）
Linux的目录在~/.config/sublime-text-2/Packages
Windows : sublimm3安装目录（sublime3）\Data\Packages\

用 Pachage Control 安装
ZHCHTODO
见 blog

删除插件

ctrl+shift+p 搜索
remove package

## 窗口分隔
菜单->View->Layout

## 文件后缀设置

先打开一个markdown文件, 在view->syntax中设定语法为markdown, 然后打开 Preferences -> Settings-More -> Syntax Specific-User 会打开一个 Markdown.sublime-settings 文件 , 在文件中加入下面一行, 就会把这些后缀的文件解析为markdown文件

    {"extensions":["mkd", "md"]}
## 用户设置

	｛
		"open_files_in_new_window": false,
		"remember_open_files": true,
		"hot_exit":true,
		"remember_full_screen": true
	｝
## 快捷键

### 自定义快捷键

    Preferrences -> Key Bindings-User
    [
        { "keys": ["ctrl+d"], "command": "run_macro_file", "args": {"file": "Packages/Default/Delete Line.sublime-macro"} },
        { "keys": ["ctrl+k"], "command": "find_under_expand" },
        { "keys": ["alt+up"], "command": "swap_line_up" },
        { "keys": ["alt+down"], "command": "swap_line_down" },
        { "keys": ["ctrl+down"], "command": "duplicate_line" },
        { "keys": ["alt+right"], "command": "next_view" },
        { "keys": ["alt+left"], "command": "prev_view" },
        { "keys": ["alt+l"], "command": "next_view" },
        { "keys": ["alt+h"], "command": "prev_view" }
    ]

### 常用快捷键

    Ctrl+KK  从光标处删除至行尾
    Ctrl+KU  改为大写
    Ctrl+KL  改为小写
    Ctrl+M  光标移动至括号内开始或结束的位置
    Ctrl+Shift+M  选择括号内的内容(按住-继续选择父括号)
    Alt+.  闭合当前标签
    右键+shift  列选择  还是 ctrl+shift+右键
    Ctrl+P   直接搜文件
          @ 搜函数, markdown中搜标题
          : 跳到行数 (Ctrl + G)
          # 在当前文件中搜索
    C+S+[ 折叠代码
    C+S+] 展开代码
    C+k0  展开所有
    C+k 1 2 3 4 按层级折叠所有，

    其它
    http://blog.sina.com.cn/s/blog_7d34486c0100vu20.html

## 安装的插件
跳到最后编辑位置

    cd Sublime Text 2/Packages
    git clone git://github.com/SamPeng87/sublime-last-edit.git


## mac 命令行
[设置在命令行打开][1]

	ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl



语法 robot framework
[Robot Framework Assistant](https://sublime.wbond.net/packages/Robot%20Framework%20Assistant)  




[1]: http://www.sublimetext.com/docs/2/osx_command_line.html
