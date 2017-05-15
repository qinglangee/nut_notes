   vim: ft=markdown  
# 设置

## 设置透明

	Edit->Profile preferrences->background 打上勾

-- 命令切换透明与不透明

	gconftool -s -t string /apps/gnome-terminal/profiles/Default/background_type solid
	gconftool -s -t string /apps/gnome-terminal/profiles/Default/background_type transparent

## 设置提示符内容
[这儿有一个说明][1]  

	export PS1='\u@\h:\w\$' 
	\u 用户名   
	\h 主机名的第一部分  
	\w 当前的工作目录
	\W 当前工作目录的“基名",(最后一层的目录名)
	\[这个序列应该出现在不移动光标的字符序列（如颜色转义序列）之前。它使 bash能够正确计算自动换行。
	\] 这个序列应该出现在非打印字符序列之后

设置了颜色的

	export PS1='\u@\[\033[32m\]\W\[\033[0m\]\$'
设置颜色

	颜色=\033[背景;前景;m
	\033[m  是固定的, [和m中间是背景色,前景色,前后用\[\]括起来==> \[\033[32m\],  后面的恢复正常颜色
按颜色显示

	echo -e "\033[32m 绿色字 \033[0m"
	echo -e "\033[33m 黄色字 \033[0m"
	echo -e "\033[40;37m 黑底白字 \033[0m"

refs:  
[终端颜色设置、路径名设置以及ls命令设置][1]  



[1]: http://blog.sina.com.cn/s/blog_6d0cbb0301019egu.html