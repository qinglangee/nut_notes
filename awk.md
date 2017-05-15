# awk 指南

## 基本用法
在unix环境中我们可以使用一下命令来打印出第一列

	awk '{print $1}' example1.txt

解释一下"'{" 单引号大括号包含awk语句是为了和shell 命令区别，$1的意思就是文本文件的第一列，正常的awk命令跟随-F参数指定间隔符号，如果是空格或tab键就可以省略了。

	awk '{if($5>20) {print $1}}' example1.txt
	awk '{if($5>20 || $5==10) {print $1}}' example1.txt

学习awk可以经常使用一下man awk 可以看到所有的函数和使用方法。


第一列数据求和
文件abc内容：

	12  mm
	23  nn
	24  dd

	cat abc | awk '{sum+=$1} END {print "Sum = ", sum}'
数多个文件行数


## awk调用shell变量的方法
有很多种方法，最简单的一种记录如下：

	line=XXX
	awk '$1== " '$line' " {print $0}' inputfile
注意的是，awk命令本身需要将模式和动作部分用单引号引用，所以里面引用shell变量是双引号+单引号，双引号是保证正确处理变量值的空格，放大一下：

	" '$line' "



refs:  
[ awk文本处理总结（入门，中级，高级）](http://blog.csdn.net/blackbillow/article/details/3847425)  
[sed、awk调用shell变量的方法](http://www.cnblogs.com/gx-303841541/archive/2012/10/25/2738029.html)  