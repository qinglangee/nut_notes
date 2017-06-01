# tmux 常见问题
sudo apt-get install tmux

## 配置文件
~/.tmux.conf  没有的话就自己创建
```
    # 设置前缀为Ctrl+j
    set -g prefix C-j
    # 取消默认的前缀按键
    unbind C-b
    #将r 设置为加载配置文件，并显示"reloaded!"信息
    bind r source-file ~/.tmux.conf \; display "Reloaded!"
     
    #up
    bind-key k select-pane -U
    #down
    bind-key j select-pane -D
    #left
    bind-key h select-pane -L
    #right
    #bind-key l select-pane -R
     
    # zoom pane <-> window
    #http://tmux.svn.sourceforge.net/viewvc/tmux/trunk/examples/tmux-zoom.sh
    bind ^z run "tmux-zoom"
     
    set-window-option -g mode-keys vi #可以设置为vi或emacs
```
## 快捷键
`prefix ?` 显示快捷键帮助
`prefix C-o`  调换窗口位置，类似于vim里的C-w
`prefix "`  横向分割窗口
`prefix %`　纵向分割窗口
`prefix o`  跳到下一个窗口
`prefix q`  显示分隔窗口编号，没什么用
`prefix c`  创建新窗口，`prefix 0-9` 可以选择打开这些窗口
`prefix l`  切换到最后使用的窗口，用于两个窗口之间来回跳
`prefix n`  选择下一个窗口, n=next
`prefix p`  选择上一个窗口
`prefix ;`  切换到最后一个使用的面板，面板间来回跳
`prefix x`  关闭面板
`prefix ＆`  关闭窗口
`prefix d`  退出tumx，并保存当前会话，这时，tmux仍在后台运行，可以通过tmux attach进入 到指定的会话
`PREFIX ,`  窗口重命名
`prefix f`  find,查找窗口
`prefix w`  window,窗口列表

## 常用命令
`tmux new -s session_name` 创建新的session

## 复制模式步骤
配置文件中把键盘设置为vi模式　`set-window-option -g mode-keys vi`
我的控制键为：prefix
1、 prefixb [ 进入复制模式
2、 参考上表移动鼠标到要复制的区域，移动鼠标时可用vim的搜索功能"/","?"
3、 安空格键开始选择复制区域
4、 选择完成后安enter键退出
5、 prefix ] 粘贴


refs:  
[tmux的使用方法和个性化配置](http://mingxinglai.com/cn/2012/09/tmux/)  
[如何使用Tmux提高终端环境下的效率](https://linux.cn/article-3952-1.html)  