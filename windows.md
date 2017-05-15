# windows 随记

关机

关机 shutdown -s -t 0 重启 shutdown -r -t 0 打开运行框（Win+R键），输入上述命令即可，后面的数字表示关机/重启延迟的时间

查看端口占用

	netstat -aon|findstr "80" 
命令行设置环境变量

	set 变量名=变量内容   # 设置环境变量
	set JAVA_HOME=        # 清空环境变量， 等号后面不写内容
创建软链接

	mklink /d  符号链接目录  目标目录
解压 chm 文件 例如我想把JDKAPI16.CHM解压到当前目录的javadoc子目录中，可以这样：

	hh.exe -decompile javadoc JDKAPI16.CHM
