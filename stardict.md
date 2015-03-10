  vim: ft=markdown

# stardict

## 安装词典
debian 的 stardict 包中并不包含词典，需要自己手动安装。这里是我自己用来安装简体中文字典的脚本，供大家参考（以root身份执行）：

#!/bin/sh

    wget http://umn.dl.sourceforge.net/sourceforge/stardict/stardict-cdict-gb-2.4.2.tar.bz2
    wget http://umn.dl.sourceforge.net/sourceforge/stardict/stardict-oxford-gb-2.4.2.tar.bz2
    wget http://umn.dl.sourceforge.net/sourceforge/stardict/stardict-stardict1.3-2.4.2.tar.bz2
    wget http://umn.dl.sourceforge.net/sourceforge/stardict/stardict-xdict-ec-gb-2.4.2.tar.bz2
    wget http://umn.dl.sourceforge.net/sourceforge/stardict/stardict-xdict-ce-gb-2.4.2.tar.bz2
    wget http://umn.dl.sourceforge.net/sourceforge/stardict/stardict-langdao-ce-gb-2.4.2.tar.bz2
    wget http://umn.dl.sourceforge.net/sourceforge/stardict/stardict-cedict-gb-2.4.2.tar.bz2
    wget http://umn.dl.sourceforge.net/sourceforge/stardict/stardict-langdao-ec-gb-2.4.2.tar.bz2
    wget http://umn.dl.sourceforge.net/sourceforge/stardict/stardict-hanzim-2.4.2.tar.bz2
*百度网盘里也存了几个tar.bz2字典文件*

    find -name 'stardict*.bz2' -exec tar jxf {} ;
    mv stardict-*/* /usr/share/stardict/dic
*这里的解压出来就是下面这个方法需要的三个文件*


## 另一种安装词典
deb文件 [下载链接][1], 在百度网盘里也有几个, [安装教程原贴][2]

一、首先下载ColorDict，附件下载。
二、关键一步，把下载好文件用压缩软件比如好压，WINRAR之类的解压出来以后，会看到两个.gz结尾的文件，我们只要其中一个data.tar.gz文件，将其解压出来并定位到data/usr/share/stardict/dic下，看到有三个文件，再解压三个中.dz结尾的文件，得到一个.dict文件，如果它不与两外两个不同名，请重新命名与他们同名，即最后是.dict 、.idx、 .ifo结尾的三个同名文件。

*上面的方法 的解压出来就是这个方法需要的三个文件*

三、将上述三个文件拷贝到你的SD卡里dictdata，然后用ColorDict重新索引或者重装软件即可











[1]: http://dl.dbank.com/c0u3ab2ojc
[2]: http://bbs.gfan.com/android-114728-1-1.html
