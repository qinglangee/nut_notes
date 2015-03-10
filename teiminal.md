Linux下终端的快捷键及建立打开终端的快捷键
Linux下终端的快捷键
 ESC???
咧嘴网上剽窃的快捷键咧嘴
 
Shift+Ctrl+T:新建标签页
 
Shift+Ctrl+W:关闭标签页
 
Ctrl+PageUp:前一标签页
 
Ctrl+PageDown:后一标签页
 
Shift+Ctrl+PageUp:标签页左移
 
Shift+Ctrl+PageDown:标签页右移
 
Alt+1:切换到标签页1
 
Alt+2:切换到标签页2
 
Alt+3:切换到标签页3
 
Shift+Ctrl+N:新建窗口
 
Shift+Ctrl+Q:关闭终端
 
终端中的复制／粘贴:
 
Shift+Ctrl+C:复制
 
Shift+Ctrl+V:粘贴
 
终端改变大小：
 
F11：全屏
 
Ctrl+plus:放大
 
Ctrl+minus:减小
 
Ctrl+0:原始大小
建立打开终端的快捷键
一、设置快捷键
首选项－－－屏幕快捷键,然后添加一个命令，并添加一个你的快捷键，如果你用的是gnome桌面建议用 
gnome-terminal命令添加快捷键，也可以用xterm，还可以用shell脚本，比如我用的是调用下面我贴的一个脚本
命令（脚本见文代码）：/home/zhangwei/.gnome2/nautilus-scripts/打开终端
二、设置右键快捷键（打开时为当前目录）
方法一：
执行命令：sudo apt-get install nautilus-open-terminal
此方法是安装一个小软件，但是我安装后和conky冲突了，所以没有用。
方法二：
用脚本，把下面的脚本保存成任意名（我的是：打开终端），然后放在主目录的.gnome2/nautilus-scripts目录下，当然你可以放一些其他常见的脚本，都可以在右键找到。比如发送到邮件／修改文件权限等等实用的功能。
脚本：
#!/bin/bash
#
# This script opens a gnome-terminal in the directory you select.
#
# Distributed under the terms of GNU GPL version 2 or later
#
# Install in ~/.gnome2/nautilus-scripts or ~/Nautilus/scripts
# You need to be running Nautilus 1.0.3+ to use scripts.

# When a directory is selected, go there. Otherwise go to current
# directory. If more than one directory is selected, show error.
if [ -n "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS" ]; then
set $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS
if [ $# -eq 1 ]; then
destination="$1"
# Go to file's directory if it's a file
if [ ! -d "$destination" ]; then
destination="`dirname "$destination"`"
fi
else
zenity --error --title="Error - Open terminal here" \
--text="You can only select one directory."
exit 1
fi
else
destination="`echo "$NAUTILUS_SCRIPT_CURRENT_URI" | sed 's/^file:\/\///'`"
fi

# It's only possible to go to local directories
if [ -n "`echo "$destination" | grep '^[a-zA-Z0-9]\+:'`" ]; then
zenity --error --title="Error - Open terminal here" \
--text="Only local directories can be used."
exit 1
fi

cd "$destination"
exec x-terminal-emulator
原文来源于：http://shiluo.110.blog.163.com/blog/static/5738732009102510845333/
