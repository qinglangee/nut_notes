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





refs:  
[Windows下mklink使用,   硬链接, 软链接和快捷方式的区别][1]  



[1]: https://blog.csdn.net/guyue35/article/details/49761347 