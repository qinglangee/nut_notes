# python 常用知识  
## 工具
*pip* 包管理器

## 语法
导入模块

	import os
	import random
	# 导入别的目录的模块
	import sys, sys.path.append("d:\\temp\\newmodule")
	import sys, sys.path.append("/home/mymodule")
全局变量， 函数中引用时用 `global` 标记

	CONSTANT = 0  
	  
	def modifyGlobal():  
	    global CONSTANT  
	    print(CONSTANT)
三目运算

	"Fire" if True else "Water" 
print 实时刷新

	是因为stdout默认是buffered I/O，所以是print到缓冲区了
	有几种办法可以解决这个问题：
	print之后加sys.stdout.flush()
	或者python -u test.py，-u参数是强制stdin，stdout，stderr无缓冲
取参数和参数个数

	import sys  
  
	print sys.argv[0] ##脚本名  
	print sys.argv[1] ## 第一个参数
	print len(sys.argv) # 没参数时是 1

## 常用函数


数字变为字符串 `str(4)`
字符串变为数字 `string.atoi(s,[，base]) //base为进制基数`
浮点数转换 `string.atof(s)`
字符转数字 `int(str)`

## 字符串操作
字符串替换 

	a = 'hello word'  # 我把a字符串里的word替换为python

	1用字符串本身的replace方法
	a.replace('word','python')

	2用正则表达式来完成替换:
	import re
	strinfo = re.compile('word')
	b = strinfo.sub('python',a)
	print b
	输出的结果也是hello python
字符串包含

	if("aa" in "aabc"):
		print "aa in aabc"  # true false
	index = "abcdaabc".find("aa")  # index == 4
字符串去两头空格

	str = "  aa  "
	str.strip()
字符串截取
	
	aa = "123456"
	a1 = aa[:-1]  # 12345
	a2 = aa[1:]  # 23456
	a3 = aa[1:3]  # 23
	a4 = aa[2:4]  # 34
	a5 = aa[0:3]  # 123
	a6 = aa[0:]  # 123456
	a6 = aa[0:12]  # 123456
字符串开头结尾

	content.startswith("ilove")
	content.endswith("ilove")
    str.startswith(str, beg=0,end=len(string));
    str.startswith( 'is', 2, 4 )
    
## 文件操作
文件复制,删除,目录复制一类的
shutil [文档][1]

## 目录
`import os`
`os.path.exists(path)` 判断一个目录是否存在
`os.makedirs(path)` 多层创建目录
`os.mkdir(path)` 创建目录

## 文件名
```
import os
f = "a/b/c/d.txt"
name, ext = os.path.splitext(f)
print name, ext
print os.path.dirname(f)
print os.path.basename(f)
```
结果
>a/b/c/d .txt
a/b/c
d.txt

## 自定义排序

`productlist.sort(lambda p1, p2:cmp(p1.getPrice(), p2.getPrice()))`




[1]: https://docs.python.org/2/library/shutil.html