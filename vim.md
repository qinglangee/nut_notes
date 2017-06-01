  vim: ft=markdown
# 常用命令
nutsstore有历史版本, ok了

## vim  十六进制编辑 :%!xxd 

## 到上一次编辑的地方

    ctrl + o
    ctrl + i   取消ctrl+o的操作
## 锁定　死锁　无反应
Ctrl-s
Ctrl-q 可以解锁

## 大小写转换
单词转换为大写   gUw  单词转换为小写  guw

## vim一个远程文件
vim scp://username@host//path/to/somefile

## 查看加载的脚本
:scriptnames


## 当前行滚动到中间zz, 顶部zt, 底部zb

## 复制当前行到剪贴板
"+yy

## 删除指定内容
:g/string/d     Delete all lines containing string
:v/string/d     Delete all lines containing which didn’t contain string

## 用swp文件恢复原文件
vim -r help.txt
Vim 会读取交换文件,另存为别的名字就可以比较了
## 打开/关闭 自动缩进
:set ai
:set noai
## 打开/关闭 行号
:set nu
:set nonu
## 设置粘贴模式, 粘贴时不会缩进
:set paste

## 其它命令
Ctrl+a  Increment number under the cursor
Ctrl+x  Decrement number under cursor
ggVGg?  Change text to Rot13

## 编辑没有权限的文件
1. vi /etc/httpd.conf 保存时，用命令:w !sudo tee %
    :w - Write a file.
    !sudo - Call shell sudo command.
    tee - The output of write (vim :w) command is redirected using tee. The % is nothing but current file name i.e. /etc/httpd.conf. In other words tee command is run as root and it takes standard input and write it to a file represented by %. However, this will prompt to reload file again (hit L to load changes in vim itself).
强烈推荐这一种用法。不过，首先得保证运行vim的用户有sudo的权限。
关于用户的sudo权限可以参考这里：
http://www.51testing.com/?uid-225738-action-viewspace-itemid-216699
2. 编辑用户$HOME/.vimrc文件将第一种方案的比较难记的命令重命名一下，下次可以直接使用。
   vim $HOME/.vimrc  添加如下的一句话，并保存。
   command -nargs=? Sudow :w !sudo tee %
   今后用vim编辑时，需要sudo保存时，直接用此处定义的Sudow命令保存即可。

## 查看/修改颜色方案
:colorscheme  default
:colorscheme  desert
:colorscheme

## 窗口调整
vim多窗口有时候需要调整默认的窗口宽度和高度，可以用如下命令配合使用

CTRL-W =        使得所有窗口 (几乎) 等宽、等高，但当前窗口使用 'winheight' 和 'winwidth'。

:res[ize] -N 
CTRL-W -        使得当前窗口高度减 N (默认值是 1)。如果在 'vertical' 之后使用，则使得宽度减 N。

:res[ize] +N
CTRL-W +        使得当前窗口高度加 N (默认值是 1)。如果在 'vertical' 之后使用，则使得宽度加 N。

:res[ize] [N]
CTRL-W CTRL-_
CTRL-W _        设置当前窗口的高度为 N (默认值为最大可能高度)。

:vertical res[ize] [N]
CTRL-W |        设置当前窗口的宽度为 N (默认值为最大可能宽度)。

z{nr}<CR>       设置当前窗口的高度为 {nr}。

CTRL-W <        使得当前窗口宽度减 N (默认值是 1)。                                              
CTRL-W >        使得当前窗口宽度加 N (默认值是 1)。

<窗口光标的移动> （三个键同时按）
CTRL-W-H 将光标移到左边窗口
CTRL-W-L 将光标移到右边窗口
CTRL-W-J 将光标移到下边窗口
CTRL-W-K 将光标移到上边窗口

注：
1、我比较倾向于命令:[vertical] res[ize] [N]，暴力直接，:-)
2、除此之外，也可以在sp或着vs的时候指定窗口的高度和宽度，具体在vim终查看帮助 help :sp

# vim设置

## 管理插件
[vim-addon-plugin说明][vim-addon-readme]
[vim-addon-plugin英文版说明][vim-addon-get-started]

## 插件文件安装, 第一个是插件自己,可以单独一个目录,第二个是其它插件仓库.

    git clone git://github.com/MarcWeber/vim-addon-manager.git   

    git clone git://github.com/MarcWeber/vim-addon-manager-known-repositories.git 
*3.怎样查找插件名字* 
在vim-addon-manager-known-repositories/db目录里, 几个文件里都有.

##  配置状态栏

配置：

    set laststatus=2 “长久显示：1
    set statusline=%t\ %y\ format:\ %{&ff};\ [%c,%l]

自己定做:

set statusline 定制格式


状态栏的定制类似C语言特性，常见的定制格式：

    c ~>列号
    l ~>行号
    r ~>只读标记
    t ~>文件名
    y ~>文件内容类型
    \&ff ~> 文件格式 unix\mac\dos
文件格式之前需要添加%完成转义，空格，竖线等特殊字符需要使用斜杠\完成转义。

例如:

    set statusline=%t\ %y\ format:\ %{&ff};\ [%c,%l] 

## windows下配置文件位置




# 链接定义
[vim-addon-readme]: http://gsnippet.googlecode.com/svn/blog/html/vim/managerplugins.html
[vim-addon-get-started]: https://github.com/MarcWeber/vim-addon-manager/blob/master/doc/vim-addon-manager-getting-started.txt
