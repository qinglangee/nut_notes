地址: http://blog.csdn.net/blackbillow/article/details/3847425
在unix环境中我们可以使用一下命令来打印出第一列
# awk '{print $1}' example1.txt

解释一下"'{" 单引号大括号包含awk语句是为了和shell 命令区别，$1的意思就是文本文件的第一列，正常的awk命令跟随-F参数指定间隔符号，如果是空格或tab键就可以省略了。

# awk '{if($5>20) {print $1}}' example1.txt

# awk '{if($5>20 || $5==10) {print $1}}' example1.txt

学习awk可以经常使用一下man awk 可以看到所有的函数和使用方法。
