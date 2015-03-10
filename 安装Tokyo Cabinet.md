
    sudo apt-get install zlib1g-dev




安装Tokyo Cabinet 、tokyotyrant
ubuntu11.04编译Tokyo Cabinet（简称：TC） tokyotyrant（TT）是出现一个错误： 缺少bzlib.h头文件。
configure: error: bzlib.h is required .


  “TC手册” 写道
As Tokyo Cabinet depends on the following libraries, install them beforehand.
zlib : for loss-less data compression. 1.2.3 or later is suggested.
bzip2 : for loss-less data compression. 1.0.5 or later is suggested.

 

    解决方法：http://ubuntuforums.org/showthread.php?t=90559， 执行如下命令 安装libbz2-dev。

 

    sudo apt-get install libbz2-dev



安装　lbzip2

今天在安装mediainfo时需要zlib，但zlib的官网打不开，apt-get insatll zlib也找不到软件包，貌似不在软件源里？

解决方法是打开ubuntu software center，搜索zlib，找到zlib1g-dev这个包，试了下，可以使用。


    安装三部曲，先进入TT TC目录
./configure
make
make install
 

 

 
