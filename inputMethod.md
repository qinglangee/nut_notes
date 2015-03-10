刚刚安装好了 Ubuntu 11.04，但是没有五笔的日子实在不好过，WINDOWS下用习惯了极点五笔，本以为极点的作者不出Linux版的，结果在网上一搜，居然有高手想到引用极点五笔的字典实现可以同时打拼音和五笔，废话少说，下面看如何操作：


1. ibus下安装极点五笔
在终端中执行如下操作

sudo wget http://www.unicom-china.com/download/vissible-ibus.tar.gz
tar -zxvf vissible-ibus.tar.gz
sudo cp vissible.db /usr/share/ibus-table/tables
sudo cp vissible.gif /usr/share/ibus-table/icons


完成后，在点任务栏中那个键盘小图标，在下拉菜单选“重新重启” 重启ibus输入法，然后再点一下键盘小图标并在下拉菜单中选“首选项”，然后在弹出的窗口中点击“输入法”选项卡，接着点“选择输入法”>"汉语"，然后点"添加" 极点五笔，OK！

原载于：http://www.jzxue.com/fuwuqi/linux/201106/22-7891.html


2. SCIM下安装极点五笔

一、安装
解压、复制 极点五笔.bin 到主目录下

sudo mv 极点五笔.bin /usr/share/scim/tables
sudo pkill scim && scim -d

退出终端再执行下面命令
scim-setup

二、设置
输入法引擎：全局设置：简体中文：极点五笔 6.1（勾选）：确定
sudo pkill scim && scim -d
退出终端

下载地址：http://forum.ubuntu.org.cn/viewtopic.php?f=8&t=237713

P.S.：其实这只是用上了极点五笔的码表，极点五笔的很多增强功能是没有的，但至少比原来的五笔输入法强了。
原载于：http://www.linuxdiyf.com/viewarticle.php?id=103953






fcitx

sudo apt-get purge scim（卸载scim输入法）
sudo add-apt-repository ppa:wengxt/fcitx-nightly
sudo apt-get update
sudo apt-get install fcitx fcitx-config-gtk fcitx-sunpinyin
sudo apt-get install fcitx-table-all

im-switch -s fcitx -z default
新版本的ubuntu用 im-config 代替了 im-switch, 再新的连 im-config也没有了, 不知道用什么配置.
sudo sh -c " echo 'export XMODIFIERS=@im=fcitx ; export GTK_IM_MODULE="fcitx" ; fcitx ' > /etc/X11/Xsession.d/95xinput "

sudo chmod 755 /etc/X11/Xsession.d/95xinput

原理我也不太懂，这个输入法我装了一下午，查了很多网站，找到的好些命令输进去都有一些问题，总之零零散散散的试了好多命令，总结下来真正起作用的就上面几条。之前没输入最后两个命令时，时图标显示出来了，但是却不能用，怎么安都没有发应，加上后面两条再重启就好拉！装好之后一定要重新启动。如果退出了fcitx，直接再终端下输入fcitx就可以启动改输入发拉！上面的命令中已经设置拉fcitx为默认输入法！ctrl+space为激活建。一般在fcitx中还没设置上下页等快捷键，需要大家右击其图标，配置fcitx，不过保存好配置后，要重新启动才能有效！

 如果装好之后提示要fcitx配置环境变量，就把下面的内容加到/etc/profile文件中，重启过后就好了！

XIM=fcitx
XIM_PROGRAM=fcitx
XMODIFIERS=@im=fcitx

添加过程：

sudo gedit/etc/profile

将上述内容粘贴到打开的profile文件的最后，保存关闭！重启！ok！别忘了配置fctix的快捷键啊！
