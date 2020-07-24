# awk 指南
[Linux awk 命令](https://www.runoob.com/linux/linux-comm-awk.html)  


# 常用方法
## 基本用法
在unix环境中我们可以使用一下命令来打印出第一列

	awk '{print $1}' example1.txt

解释一下"'{" 单引号大括号包含awk语句是为了和shell 命令区别，$1的意思就是文本文件的第一列，正常的awk命令跟随-F参数指定间隔符号，如果是空格或tab键就可以省略了。

	awk '{if($5>20) {print $1}}' example1.txt
	awk '{if($5>20 || $5==10) {print $1}}' example1.txt

学习awk可以经常使用一下man awk 可以看到所有的函数和使用方法。
## 指定分隔符
awk -F"," '{print $1}' aa.txt
awk -F, '{print $1}' aa.txt

## 单独一列排序、去重、统计
`cat aa.txt | awk  '{print $2}'  | sort | uniq  | wc -l `
## 指定根据某一列排序
`cat aa.txt | awk  '{print $1,$2,$3}'  | sort -k2 `   # 指定按第二列排序(默认以空格分开的)
`cat aa.txt | awk  '{print $1,$2,$3}'  | sort -k1 -k2 `   # 先按第一列再按第二列排序

## 第一列数据求和
文件abc内容：

	12  mm
	23  nn
	24  dd

	cat abc | awk '{sum+=$1} END {print "Sum = ", sum}'
数多个文件行数
## 根据列 group by 
```
# group by 第二列， 求第3列的和
cat aa.txt | awk '{a[$2] += $3}END{for(i in a){printf "%s %d\n", i, a[i]} }' |sort -n -k2
```
## 实现切分 group by 功能
```
[app_usr@ haha]$ ls
BOSSNM_0_3032_9069_50_H1_20120315_020_00000011_000.json  BOSSNM_0_3032_9069_50_H1_20120315_020_00000015_000.json
BOSSNM_0_3032_9069_50_H1_20120315_020_00000012_000.json  BOSSNM_0_3333_9069_50_H1_20120315_020_00000011_000.json
BOSSNM_0_3032_9069_50_H1_20120315_020_00000013_000.json  BOSSNM_0_3333_9069_50_H1_20120315_020_00000012_000.json
BOSSNM_0_3032_9069_50_H1_20120315_020_00000014_000.json  BOSSNM_0_3333_9069_50_H1_20120315_020_00000013_000.json
[app_usr@ haha]$ 
[app_usr@ haha]$ ls | awk '{a[substr($0, 10, 9)] += 1}END{for (i in a){printf "%s %d\n", i, a[i]} }'
3333_9069 3
3032_9069 5
```

# 基本语法
## 语法格式
`awk '{[pattern] action}' {filenames}`   # 行匹配语句 awk '' 只能用单引号

## 每行按空格或TAB分割，输出文本中的1、4项
`awk '{print $1,$4}' log.txt`

## 或者使用内建变量指定分隔符
 $ awk 'BEGIN{FS=","} {print $1,$2}'     log.txt

## 设置变量
`awk -va=1 '{print $1,$1+a}' log.txt`

## 调用文件
`awk -f {awk脚本} {文件名}`
`$ awk -f cal.awk log.txt`

## 使用正则，字符串匹配
```
awk '$2 ~ /th/ {print $2,$4}' log.txt  # 输出第二列包含 "th"，并打印第二列与第四列

# 输出包含 "re" 的行
$ awk '/re/ ' log.txt

#忽略大小写
$ awk 'BEGIN{IGNORECASE=1} /this/' log.txt
```



## awk调用shell变量的方法
有很多种方法，最简单的一种记录如下：

	line=XXX
	awk '$1== " '$line' " {print $0}' inputfile
注意的是，awk命令本身需要将模式和动作部分用单引号引用，所以里面引用shell变量是双引号+单引号，双引号是保证正确处理变量值的空格，放大一下：

	" '$line' "



refs:  
[ awk文本处理总结（入门，中级，高级）](http://blog.csdn.net/blackbillow/article/details/3847425)  
[sed、awk调用shell变量的方法](http://www.cnblogs.com/gx-303841541/archive/2012/10/25/2738029.html)  