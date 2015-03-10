重启unity ubuntu 界面重启
unity --reset   现在已经不支持这个方法了
12.10  http://itsfoss.com/how-to-reset-unity-and-compiz-in-ubuntu-12-10/
1. 安装
> sudo apt-get install dconf-tools
2. 恢复配置
> dconf reset -f /org/compiz/
3. 重启unity
> setsid unity


Standard Widget Toolkit与unity的overlay_scrollbar冲突。
解决方法有两种：
1.全局禁用overlayscroolbar:
sudo su -c 'echo export LIBOVERLAY_SCROLLBAR=0 > /etc/X11/Xsession.d/80overlayscroolbars'
这种方法会使所有的滚动条都回到传统的样式；
2.在eclipse的启动文件中禁用overlayscroolbar:
编辑/usr/bin/eclipse，在
export GDK NATIVE_WINDOW=TRUE
这行下加上
export UBUNTU_MENUPROXY=0
export LIBOVERLAY_SCROLLBAR=0
这种方法只会将eclipse中的滚动条改为传统样式
