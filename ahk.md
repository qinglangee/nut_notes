# ahk tips
论坛地址  https://autohotkey.com:443/boards  qinglangee  zcqingdao@outlook.com  qinglang

## micro

	#MaxThreadsPerHotkey, 2       ; 最多两个线程
## 常用语句

### 变量
ahk 所有的变量都是字符串， 但纯数字的在进行数学计算时会自动转成数字

除了在函数里的局部变量外，所有变量都是全局的；就是说，它们的内容可以在脚本的任意部分被读取或更改。另外，变量不需要声明

要指定一个字串给一个变量，参照这些例子：

	MyVar1 = 123
	MyVar2 = 我的字串
 要执行一个数学运算，使用冒号-等号运算符 (:=) 来指定一个表达式的结果给一个变量， 像下面的例子：

	NetPrice := Price * (1 - Discount/100)
### 快捷方式

	::uzhi1::32070638jcpu
	::mypass::abcd{#}cdef{+}
需要转义的字符 # / ^ / { / } / + / !, 共6个， 转义用大括号包围 

### 生成exe
Ahk2Exe.exe

在安装目录下  `d:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe`
### 表达式
比较

	if( num > 3)  if(num > 5)  if(num ==2)   if(num != 2)
