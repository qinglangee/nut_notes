  vim: ft=markdown
# 链接
## 侧边栏的文章都不错 
http://www.thegeekstuff.com/2009/06/15-practical-crontab-examples/

# 查看XXX

## 查看所有位置　　
>locate mvn

## 查看全局最大打开文件数
cat /proc/sys/fs/file-nr 
5100 0 101747
第三个数字101747就是当前系统的全局最大打开文件数(Max Open Files), 用 root 权限修改 /etc/sysctl.conf 文件:
 fs.file-max = 1000000 

## 查看进程最大打开文件数

    ulimit -n
    ulimit -a  查看所有的限制数
too many open files
### 修改进程最大打开文件数
如果发现open files项比较小，可以按如下方式更改： 

1. 检查/proc/sys/fs/file-max文件来确认最大打开文件数已经被正确设置。 

  如果设置值太小，修改文件/etc/sysctl.conf的变量到合适的值。这样会在每次重启之后生效。 如果设置值够大，跳过这一步。否则，编辑文件/etc/sysctl.conf，插入下行： 
  fs.file-max = 1220054 
2. 在/etc/security/limits.conf文件中设置最大打开文件数，重启生效, 下面是一行提示： 
* - nofile 8192 

只有超级用户才能修改 hard类型的限制。
［转者注］:
看完此帖后，对以上2步不甚明了。特古鸽之。
步骤1 是通过修改 /etc/sysctl.conf， 运行时修改内核参数，解除内核对进程打开文件数的限制
步骤2 是通过修改 Linux PAM，对当前会话，改变打开文件数的限制

## 查看所有线程数
1、top -H
手册中说：-H : Threads toggle
加上这个选项启动top，top一行显示一个线程。否则，它一行显示一个进程。
2、ps xH
手册中说：H Show threads as if they were processes,这样可以查看所有存在的线程。
3、ps -mp <PID>
## 查看多核CPU负载

    top -d 1 或者top 后按 1
## 查看子线程数 
有些时候需要确实进程内部当前运行着多少线程，那么以下几个方法值得一用。

1.根据进程号进行查询：

    # pstree -p 进程号
    # top -Hp 进程号

2.根据进程名字进行查询：

    # pstree -p `ps -e | grep server | awk '{print $1}'`
    # pstree -p `ps -e | grep server | awk '{print $1}'` | wc -l

## 查看主机信息
dig domain
dig -x host

## 查看内核信息
cat /proc/version
uname -a

## 查看ubuntu版本

    cat /etc/issue

适用于所有linux系统

    # lsb_release -a
适用于centos

    # cat /etc/redhat-release
    # rpm -q redhat-release 


## 查看文件中间的几行

## 查看服务设置
关闭,开启服务的开机启动, 查看启动级别设置

    # chkconfig iptables on
    # chkconfig iptables off
    # chkconfig |grep iptables
设置开机启动

    chkconfig --levels 235 mongod on
ubuntu 的没有这个工具, 用update-rc.d

    # update-rc.d toilet default
开机启动也可以在 /etc/rc.local 中设置要执行的命令
## 查看cpu占用高的线程
[cpu 占用率高的线程找出来:][1]

     ps H -eo user,pid,ppid,tid,time,%cpu,cmd --sort=%cpu
## 查看cpu info

    cat /proc/cpuinfo
## 查看命令执行的时间

    # export HISTTIMEFORMAT=%F %T  



## 查看某进程打开了哪些文件？

先通过`ps aux | grep [进程名]`找到该进程的进程号，然后`ls -la /proc/[进程号]/fd`，输出不仅包含打开的普通文件。

另一种不太直观的方法是使用lsof，`lsof -c [进程名]`，但这个命令的输出包含进程打开的各种类型的文件，可以简单过滤一下`lsof -c [进程名] | grep REG`。
## 查看某一个文件正在被哪些进程所读写

    fuser filename
    fuser -mv  filename
## 查看端口占用的pid

    lsof -n -P -i :80 
# 设置xxx

## 设置history数量

    HISTSIZE=10000
    HISTFILESIZE=20000

## 人为提高cpu占用

    cat /dev/urandom | md5sum
# 命令简介
## 系统监控命令
iostat
meminfo  free
mpstat
netstat
nmon
pmap
ps  pstree
sar
strace
tcpdump
top
uptime
vmstat
wireshark

## grep
### 查看特定类型的文件

    grep -R --include="*.cpp" aaabbb  ./src

同样的功能, 用find的exec参数

    find -name '*.xml' -exec grep b  {} \; -print

## locate
显示语言的设置
locate -a  # 显示所有的可用选项
/etc/profile  设置locate的值
export LC_ALL=zh_CN.utf8

# 用户
## 查看用户信息

### 查看用户所在的组
groups
### 查看所有用户信息
cat /etc/group 查看所有的用户组及权限
cat /etc/passwd 查看所有用户及权限



### 查看用户及其所在组信息

    id soloner
    uid=500(soloner) gid=501(uniqueone) groups=501(uniqueone) context=root:system_r:unconfined_t:SystemLow-SystemHigh

## 用户加入sudo用户组
ubuntu 下把用户加入root组:

    gpasswd -a abc root
centos

1.修改 /etc/sudoers 文件，在最后加入一下内容

    %admin ALL=(ALL) ALL //将要指定具有sudo 权限的用户放在 admin组里
2.添加 admin 组

    groupadd admin
3.添加用户

    useradd zhangsan
4.添加用户到 admin 组

    usermod -a -G admin zhangsan
## 修改文件的用户组
chown -R user:userGroup file

## 添加用户
useradd username

## 修改用户的组
usermod -g groupA user   //强制把用户改到这个组中
usermod -G groupA user   //用户只在这一个组中
usermod -a -G groupA user  //用户在groupA中也在他原来的组中

## 修改用户密码
passwd 用户名 （修改密码）
三种方式非交互修改密码
第一种：

    echo “123456″ | passwd –stdin root
第二种：
a. 首先将用户名密码一起写入一个临时文件.

    cat chpass.txt
    root:123456
    zhaohang:123456
b. 使用如下命令对用户口令进行修改：

    chpasswd < chpass.txt

第三种：
a. 用 openssl passwd -1 来生成用户口令，连同用户名一起写入文件.
http://www.linuxqq.net/archives/573.html

## 踢出用户
pkill -kill -t pts/2

## 禁止用户远程登录
vim /etc/ssh/sshd_config
禁止用户user1登陆，多个空格分隔
DenyUsers user1
禁止用户组group1的所有用户登录，多个空格分隔
DenyGroups group1

## 禁止用户登录

1.在新添加一个新用户的时候就指定这个用户不能远程登录
useradd  -s /sbin/nologin zgsj        //这里就是创建了一个不能远程登录的zgsj用户
2、我们通过修改/etc/passwd文件中用户登录的shell来实现linux禁止用户登录
zgsj:x:500:500::/home/lynn:/bin/bash
更改为：
zgsj:x:500:500::/home/lynn:/sbin/nologin



## 修改用户名：

    # uniqueone -> soloner
    usermod -l soloner uniqueone


修改用户所在的用户组名称：groupmod -g 501 -n soloner uniqueone

再次查看用户及其所在组信息：id soloner

uid=500(soloner) gid=501(soloner) groups=501(soloner) context=root:system_r:unconfined_t:SystemLow-SystemHigh

物理上修改用户工作主目录名称：mv /home/uniqueone /home/soloner

直接从逻辑上修改新用户 soloner 工作主目录的指向，会提示出修改某文件时错误，所以先使用 ctrl+alt+backspace 注销，重新再以 root 登录，然后再执行下面的操作。

逻辑上修改用户工作主目录的指向：usermod -d /home/soloner soloner

OK ，这个时候，注销，即可以 soloner 用户登录了。

# X设置

## 禁用新式的滚动条overlayscroolbars

sudo su -c 'echo "export LIBOVERLAY_SCROLLBAR=0" > /etc/X11/Xsession.d/80overlayscroolbars'

# 常用命令

## 程序前后台转换
jobs  查看状态
fg  到前台  bg  到后台
Ctrl + z 到后台

    command &
    jobs -l
    fg %n
    bg %n

##  查看程序启动时间
ps -eo pid,tty,user,comm,stime,etime |grep mysql| more

## 查看系统环境变量
env
set 命令显示所有本地定义的Shell变量


## 解压，压缩
```
$ zip -r archive-name.zip directory-to-compress
$ unzip archive-name.zip

$ gzip -d abc.gz

$ tar -zcvf archive-name.tar.gz directory-to-compress
$ tar -zxvf archive-name.tar.gz
$ tar -zxvf archive-name.tar.gz -C /tmp/extract-here/
# tar查看包内文件列表
$ tar -tf slow.tar
$ tar -tzf slow.tar.gz
# 只解压一个文件 
$ tar -xf aa.tar path/to/file
# 只解压一个文件 file 到目录 abc
$ tar -C abc -xf aa.tar path/to/file

# bz2 压缩率好一些
$ tar -jcvf archive-name.tar.bz2 directory-to-compress
$ tar -jxvf archive-name.tar.bz2 -C /tmp/extract-here/

$ tar -cvf archive-name.tar directory-to-compress
$ tar -xvf archive-name.tar.gz
$ tar -xvf archive-name.tar -C /tmp/extract-here/
```
xz压缩
xz压缩文件方法或命令
xz -z 要压缩的文件
如果要保留被压缩的文件加上参数 -k ，如果要设置压缩率加入参数 -0 到 -9调节压缩率。如果不设置，默认压缩等级是6.

xz解压文件方法或命令
xz -d 要解压的文件
同样使用 -k 参数来保留被解压缩的文件。 

rar
## 最简单的解压
$ rar e filename.rar

## 安装软件

运行终端命令：sudo dpkg -i google-chrome-stable_current_i386.deb，提示“dpkg：依赖关系问题使得 google-chrome-stable 的配置工作不能继续”，大汗～ 那就终端运行 sudo apt-get -f install 命令先安装依赖包，之后再sudo dpkg -i google....

rpm 包转换为 deb包
alien  xxx.rpm



echo "show processlist" | mysql -uskst -p'TestDBSkst$@'  | awk '{print $3}' | awk -F : '{print $1}' | sort | uniq -dc
TestDBSkst$@  

locate filename
locate 更新updatedb 

apt-get

apt-cache search  查找软件包 

## df 查看硬盘的总容量、已用容量与inode等 
du 查看文件已用容量

## 清空缓存 原先默认值是0
第一行写入未同步的缓存, 第二行告诉kernal清空缓存
$ sync
$ echo 3 > /proc/sys/vm/drop_caches
ubuntu下
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches

## 加入启动栏
设置启动图标 任务栏
http://askubuntu.com/questions/80013/how-to-pin-eclipse-to-the-unity-launcher
For 12.04 and 11.10
First, create a .desktop file to eclipse:

gedit ~/.local/share/applications/opt_eclipse.desktop
Then, paste this inside (dont forget to edit Exec and Icon values):

    [Desktop Entry]
    Type=Application
    Name=Eclipse
    Comment=Eclipse Integrated Development Environment
    Icon=** something like /opt/eclipse/icon.xpm **
    Exec= ** something like /opt/eclipse/eclipse **
    Terminal=false
    Categories=Development;IDE;Java;


After that, open that folder with nautilus:

nautilus ~/.local/share/applications
Add execution permission with right click Properties->Permissions->Allow execution...

And drop opt_eclipse.desktop to launcher.

## 开机启动脚本
/etc/rc.local

## 查看安装的包
dpkg -l

sar -u  查看CPU使用率
sar -q  查看平均负载
sar -r  查看内存使用
sar -W  查看页面交换发生情况

## 定时任务
crontab -l    list
crontab -e    edit
设置默认的编辑器
export VISUAL=vim
执行cron任务时有可能会乱码,可以先设置一下编码再执行

export LANG=en_US.UTF-8
格式

    分　时　日　月　周　命令
    *   *   *   *   *   ls

    * * * * *   默认就是一分钟一次
    */1 * * * *   一分钟一次
    */3 * * * *   3分钟一次
    0/3 * * * *   0分开始, 3分钟一次

    45 4 1,10,22 * * /usr/local/etc/rc.d/lighttpd restart  #上面的例子表示每月1、10、22日的4 : 45重启apache
    30 21 * * *  ls  # 每天的21:30执行
    10 1 * * 6,0 ls  # 每周六、周日的1 : 10执行
    0,30 18-23 * * * ls   # 在每天18 : 00至23 : 00之间每隔30分钟执行
    * 23-7/1 * * * ls     # 晚上11点到早上7点之间，每隔一小时执行
    0 11 4 * mon-wed ls   # 每月的4号与每周一到周三的11点执行

## 时间同步
ntpdate 192.168.200.10

## fuser 查看哪个进程在使用设备
fuser -km /nfsdata
-k  kill
-m  mount

## bash
查找历史命令 Ctrl-r
熟悉bash的作业管理，如： &, Ctrl-Z, Ctrl-C, jobs, fg, bg, kill, 等等。当然，你也要知道Ctrl+\（SIGQUIT）和Ctrl+C （SIGINT）的区别


在 bash 里，使用 Ctrl-R 而不是上下光标键来查找历史命令。
在 bash里，使用 Ctrl-W 来删除最后一个单词，使用 Ctrl-U 来删除一行

在bash的脚本中，你可以使用 set -x 来debug输出。使用 set -e 来当有错误发生的时候abort执行

如果你有输了个命令行，但是你改变注意了，但你又不想删除它，因为你要在历史命令中找到它，但你也不想执行它。那么，你可以按下 Alt-# ，于是这个命令关就被加了一个#字符，于是就被注释掉了

## 数据处理

    了解 sort 和 uniq 命令 (包括 uniq 的 -u 和 -d 选项).

    了解用 cut, paste, 和 join 命令来操作文本文件。很多人忘了在cut前使用join。

    如果你知道怎么用sort/uniq来做集合交集、并集、差集能很大地促进你的工作效率。假设有两个文本文件a和b已解被 uniq了，那么，用sort/uniq会是最快的方式，无论这两个文件有多大（sort不会被内存所限，你甚至可以使用-T选项，如果你的/tmp目录很小）

## xargs
删除aa目录中与bb目录同名的文件  

    ls bb |xargs -i rm ~/temp/d3/aa/{}
删除find 找到的文件

    find aa | xargs rm

目录中文件重命名,加上.bak( -t 表示先打印出命令)    ls |xargs -t -i mv {} {}.bak
## scp
scp 远端的时候，你可以按tab键来查看远端的目录和文件


## 删除文件ab中的abc字符,abc是分开的,单独删除

    cat aa | tr -d abc
    tr -d abc < aa

## 安装imageMagic
http://www.imagemagick.org/download/www/install-source.html#windows
安装JMagic

nstall ImageMagick

    sudo apt-get install imagemagick
    2. Install JMagick
    sudo apt-get install libjmagick6-java
    3. Copy jmagick jars to your classpath
    e.g.
    cp /usr/share/java/jmagick*.jar /usr/local/apache-tomcat-5.5.27/common/lib
    4. Copy libJMagick.so to a folder listed in 'java.library.path'
    copy /usr/lib/jni/libJMagick.so /usr/lib/
    /* maybe you should change the permission of the so too */
    sudo chmod 777 /usr/lib/libJMagick.so
    关于第四个步骤, 是因为我在测试JMagick的时候出现了错误
    java.lang.UnsatisfiedLinkError: no JMAgick in java.library.path.
    结果打印了System.getProperty("java.library.path"), 里面有/usr/lib, 而不是/usr/lib/jni.
    所以需要把libJMagick.so复制到/usr/lib中去.

## ssh代理
ssh -qTfnN -D 7070  xxx@x.x.x.x 

## sort 

    sort -nr  # n: 按数字排序  r: 反向排序

## nl 给输入的内容加上行号后输出
ex:  sort -nr file | nl

## column 格式化输入内容再输出
ex: column -c3 -s " " -t filename

## 数学计算 计算器
expr 02 - 1  # 注意运算符两过要有空格
bc
echo "02-1" | bc
## 打印前10条用的最多的命令

    history | awk '{CMD[$2]++;count++;} END { for (a in CMD )print CMD[ a ]" " CMD[ a ]/count*100 "% " a }' |sort -nr | column -c3 -s " " -t | nl | head -n10

    history |perl -lane '$map{$F[1]}++;END{map {print ++$i." $map{$_} ".$map{$_}/keys(%map)." $_\n"} reverse sort {$map{$a}<=>$map{$b}} keys(%map);}'|head -n10

    history | perl -ne '/\s+\d+\s+(.*)/ && ++$map{$1};END{map {print ++$i." $map{$_} ".$map{$_}/keys(%map)." $_\n"} reverse sort {$map{$a}<=>$map{$b}} keys(%map);}' | head -n10
# 解决问题

## no such file or directory
有一些32位的程序执行时, 会报错 no such file or directory, 是因为系统缺少一些32位相关的包, 安装下面这个库可以解决问题

    sudo apt-get install ia32-libs
===========================================================
===========================================================
===========================================================
===========================================================
===========================================================
===========================================================
源, 放在最后
备份,然后找新的粘进去  
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
http://wangheng.org/ubuntu-12-04-source-list.html

[1]: http://blog.csdn.net/chen3888015/article/details/7432868
