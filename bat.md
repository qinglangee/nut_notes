# bat 脚本语法

## 特殊变量
`echo %~dp0`  脚本所在的目录
## 变量
设置变量    set aa=5  等号两边不能有空格
使用变量    echo %aa% 

把命令的输入赋值给变量。 如果输出有多行，会赋值多遍，就只取了最后一行。 如果行中有空格，就取空格前的内容。  
```
for /F %%i in ('pwd') do ( set commitid=%%i)
echo commitid=%commitid%
```



