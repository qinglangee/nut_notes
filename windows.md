# windows 随记

## 关机

关机 shutdown -s -t 0 重启 shutdown -r -t 0 打开运行框（Win+R键），输入上述命令即可，后面的数字表示关机/重启延迟的时间

## 查看端口占用

	netstat -aon|findstr "80"
## 命令行设置环境变量

	set 变量名=变量内容   # 设置环境变量
	set JAVA_HOME=        # 清空环境变量， 等号后面不写内容
## 创建软链接 [链接][1]

	mklink /d  符号链接目录  目标目录

	MKLINK [[/D] | [/H] | [/J]] Link Target
        /D      创建目录符号链接。默认为文件符号链接。
        /H      创建硬链接而非符号链接。
        /J      创建目录联接。
    /D 与 /J 的区别， /D 可以用相对目录， /J只用绝对目录

## 把用户文件放到D盘
1. 在账户里新建一个账户
2. win-r 打开运行，输入msconfig, 把常规改为诊断启动，引导改为安全引导，重启
3. 用新用户登录，把旧用户 zhch 的目录移到`d:\userd\zhch`
4. 到 `C:\Users\`下创建软链接`mklink /d zhch d:\userd\zhch`
5. 打开 msconfig ,把常规改为正常启动，引导去掉安全引导的勾选，重启。 

## 命令行改为utf-8编码
chcp 65001


## 解压 chm 文件
例如我想把JDKAPI16.CHM解压到当前目录的javadoc子目录中，可以这样：

	hh.exe -decompile javadoc JDKAPI16.CHM


# win10 新功能
也可能是以前系统的不知道的功能

## 截图 Win-Shift-s
## 录屏 Win-g
设置里可以设置录哪些声音，但它只录全屏。。。

## 激活 
win7  百度盘软件目录中有个 win7Activation.rar

win10 百度盘软件目录中有个 win10KMSpicoActivator.zip  
1 关掉win10实时病毒防护  windows安全中心设置-病毒和威胁防护-管理设置-实时保护(关掉)
2 以管理员运行 KMSpico-setup.exe . 
3 安装完后重启，再次关掉实时病毒防护。 
4 开始菜单，最近添加中会有 KMSpico, 以管理员运行。 点击出现的红色大按钮。 激活完成后再重启就可以了。  
英文介绍页面 https://www.bestkms.com/windows-10-activator/

其它的激活工具  
    1. 云萌 win10 激活工具 开源，一键激活
    2. HWIDGEN 是一款由国外nsane论坛上的大神制作的 win10 数字权利激活工具。 它可以激活几乎所有的 win10 版本系统，关键是一次激活后就算重装系统也不用再次激活(这也太牛逼了吧)，系统联网后会自动激活。 

## usb 删除老是不成功
有可能是系统杀毒软件一直在扫描usb，太大的话就容易扫不完一直占用。 到磁盘管理里面把对应磁盘脱机就可以停止。   


refs:  
[Windows下mklink使用,   硬链接, 软链接和快捷方式的区别][1]  



[1]: https://blog.csdn.net/guyue35/article/details/49761347
