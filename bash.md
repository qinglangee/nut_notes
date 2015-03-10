   vim:ft=markdown  
# 脚本编程  链接

## 使用Bash编写Linux Shell脚本-6.表达式 
http://blog.csdn.net/fox_lht/article/details/5894940

## 脚本示例

read 读取文本行

    while read myline
    do
        echo "LINE:" $myline
    done < myfile.txt
    cat myfile.txt | while read myline
    do
        echo 123
    done

## 常用
### 上一条命令的参数

    ls aa.txt
    vim !!:$
!^ 从上一条命令获得第一项参数： 

    # cp anaconda-ks.cfg anaconda-ks.cfg.bak 
    anaconda-ks.cfg 
    # vi -5 !^ 
    vi anaconda-ks.cfg
### 根据模板删除字串（ % ， # ， %% ， ## ）

如果变量后面跟着井号，则返回匹配模板被删除后的字串。一个井号为最小可能性的匹配，两个井号为自大可能性的匹配。表达式返回模板右边的字符。
\#号的模板匹配左边,返回匹配区右边的子串
$ COMPANY="Nightlight Inc."
$ printf "%s/n" "${COMPANY#Ni*}"
使用百分号，表达式返回模板匹配区左边的字符
$ printf "%s/n" "${COMPANY%%t*}"
大括号里面,前面是变量名,后面是模板

su tomcat -s /bin/bash

### here document
cat << EOF
here is here document
EOF
>> 这两大于号是不需要的, 在这fix bug
### 字符串长度
${#VARIABLE_NAME} 可以给出字符串的长度。

### 获取目录名和文件名
-- To find base directory
APP_ROOT=`dirname "$0"`
 
-- To find the file name
filename=`basename "$filepath"`
 
-- To find the file name without extension
filename=`basename "$filepath" .html`

### !$
!$是一个特殊的环境变量，它代表了上一个命令的最后一个字符串。如：你可能会这样：
$mkdir mydir
$mv mydir yourdir
$cd yourdir
可以改成：
$mkdir mydir
$mv !$ yourdir
$cd !$

## 语法
case 语法

    case $1 in 
    a) echo alpha;; 
    b) echo beta;; 
    c) echo coda;; 
    *) echo other;; 
    esac

大小判断

    if [[ $# -eq 0 ]];then exit 0;fi;    # 数字相等

    整数比较

    -eq

        等于

        if [ "$a" -eq "$b" ]
    -ne

        不等于

        if [ "$a" -ne "$b" ]
    -gt

        大于

        if [ "$a" -gt "$b" ]
    -ge

        大于等于

        if [ "$a" -ge "$b" ]
    -lt

        小于

        if [ "$a" -lt "$b" ]
    -le

        小于等于

        if [ "$a" -le "$b" ]
    <

        小于(在双括号中使用)

        (("$a" < "$b"))
    <=

        小于等于(在双括号中使用)

        (("$a" <= "$b"))
    >

        大于(在双括号中使用)

        (("$a" > "$b"))
    >=

        大于等于(在双括号中使用)

        (("$a" >= "$b"))

    字符串比较

    =

        等于

        if [ "$a" = "$b" ]
    ==

        等于

        if [ "$a" == "$b" ]

        与=等价.

        Note  

        ==比较操作符在双中括号对和单中括号对中的行为是不同的.

          1 [[ $a == z* ]]    # 如果$a以"z"开头(模式匹配)那么结果将为真
          2 [[ $a == "z*" ]]  # 如果$a与z*相等(就是字面意思完全一样), 那么结果为真.
          3 
          4 [ $a == z* ]      # 文件扩展匹配(file globbing)和单词分割有效. 
          5 [ "$a" == "z*" ]  # 如果$a与z*相等(就是字面意思完全一样), 那么结果为真. 
          6 
          7 # 感谢, Stephane Chazelas

    !=

        不等号

        if [ "$a" != "$b" ]

        这个操作符将在[[ ... ]]结构中使用模式匹配. 
    <

        小于, 按照ASCII字符进行排序

        if [[ "$a" < "$b" ]]

        if [ "$a" \< "$b" ]

        注意"<"使用在[ ]结构中的时候需要被转义. 
    >

        大于, 按照ASCII字符进行排序

        if [[ "$a" > "$b" ]]

        if [ "$a" \> "$b" ]

        注意">"使用在[ ]结构中的时候需要被转义.

        参考例子 26-11, 这个例子展示了如何使用这个比较操作符. 
    -z

        字符串为"null", 意思就是字符串长度为零
    -n

        字符串不为"null".

        Caution 

        当-n使用在中括号中进行条件测试的时候, 必须要把字符串用双引号引用起来. 如果采用了未引用的字符串来使用! -z, 甚至是在条件测试中括号(参见例子 7-6)中只使用未引用的字符串的话, 一般也是可以工作的, 然而, 这是一种不安全的习惯. 习惯于使用引用的测试字符串才是正路. [1] 

    ## 脚本调试

    ### -n 参数

    “-n”可用于测试shell脚本是否存在语法错误，但不会实际执行命令
    ### 命令行选项 -x 
    http://coolshell.cn/articles/1379.html
    [bash脚本调试方法 ](http://blog.csdn.net/jjaing/article/details/5385637)

你可以让bash打印出你脚本执行的过程中的所有语句。这很简单，只需要使用bash的-x选项就可以做到
$ bash -x aa.sh

设置下面的环境变量

    export PS4='+${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]}: '
可以在每一行前加上文件的行号
$ bash -x aa.sh
* shell的执行选项除了可以在启动shell时指定外，亦可在脚本中用set命令来指定。 "set -参数"表示启用某选项，"set +参数"表示关闭某选项
只调试一部份脚本

    set -x
    echo "Today is $(date %Y-%m-%d)"
    set +x

### 写一个debug函数

    _log() {
        if [ "$_DEBUG" == "true" ]; then
            echo 1>&2 "$@"
        fi
    }

### 使用bash专用调试器
[bashdb](http://bashdb.sourceforge.net/)
[文档](http://bashdb.sourceforge.net/bashdb.html)

