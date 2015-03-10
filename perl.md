  vim: ft=markdown 

# learn perl in 10000000 minutes

## 函数 and 方法

### substr

    $str="testtest";  
    print substr($str,0,5);
    # 从后面截取16个字符
    $newstr = substr($tmp,-16);

### 文件判断

    -f 文件为普通文件  
    -d 文件为目录
    -e 文件是否存在
    my $file="filename";
    if(-f $file){...}else{...}
### 参数, 参数个数
命令输入判断
$#ARGV+1

函数内判断参数个数
$#_ +1
### 字符串连接

    print "here is $num apples\n";
    print "here is ".$num." apples\n";
## 单行命令
### 替换文件中的内容 

    perl -e 's/aa/bb/g' -pi *

    -e 执行单行命令   s 替换内容 g 全部替换
    -n assume "while (<>) { ... }" loop around program
    -p 跟 -n 作用类似, 但是会打印行的内容
    -i 直接编辑 <> 文件的内容
    -l 对输入内容自动chomp，对输出内容自动添加换行
### 模拟grep

    perl -e 'print "$_\n" if/abc/' -n *

## 导入外部文件

require("zhchlib/common.pl");

## 打印前10条用的最多的命令
perl 的 -ne 用法, -la用法, END 用法, map  reverse  sort  keys 用法 

    history |perl -lane '$map{$F[1]}++;END{map {print ++$i." $map{$_} ".$map{$_}/keys(%map)." $_"} reverse sort {$map{$a}<=>$map{$b}} keys(%map);}'|head -n10

    history | perl -ne '/\s+\d+\s+(.*)/ && ++$map{$1};END{map {print ++$i." $map{$_} ".$map{$_}/keys(%map)." $_\n"} reverse sort {$map{$a}<=>$map{$b}} keys(%map);}' | head -n10

## 数学计算
* 取整
int(expr)
## 循环结构
* 跳出循环
while($a>8){
    if($a>12){
        last; // 相当于java的break;
    }
}
* 下一次循环
 next;  // 相当于java的continue;
## 执行shell命令
* system("command");
使用该命令将开启一个子进程执行引号中的命令，父进程将等待子进程结束并继续执行下面的代码
它会返回执行后的状态

    @args = (“command”, “arg1″, “arg2″);
    system(@args) == 0
    or die “system @args failed: $?”

当然，你也可以用类似于下面的语句来检查出错的原因：

    iif ($? == -1) {
    print “failed to execute: $!\n”;
    }
    elsif ($? & 127) {
    printf “child died with signal %d, %s coredump\n”,
    ($? & 127),  ($? & 128) ? ‘with’ : ‘without’;
    }
    else {
    printf “child exited with value %d\n”, $? >> 8;
    }
* exec("command");
效果同system命令类似，区别是不会开启子进程，而是取代父进程，因此执行完引号中的命令后进程即结束。一般和fork配合使用
仅仅是执行一个系统的命令，一般情况下并没有返回值。exec只有在系统没有你要执行的命令的情况下，才会返回false值。
*  `command`;
使用反引号调用外部命令能够捕获其标准输出，并按行返回且每行结束处附带一个回车。反引号中的变量在编译时会被内插为其值。
如果也要收集错误信息, 这样写  command 2>&1
* 打开名柄

    open LIST "ls -l|";
        open MORE "|more";
        @list=<LIST>;
        print MORE @list;
        close(LIST);
        close(MORE);
使用带管道的文件句柄来执行外部命令，使用方式与读写文件类似。可以从外部命令的输出读取数据，也可以将数据输出到外部命令作为输入。
* 当我们需要保存系统命令运行的结果，以便分析并作进一步的处理时，就要用到readpipe这个函数了。例如

    @result = readpipe( “ls -l /tmp” );
    print “@result”;
* 子进程

     defined(my $pid=fork) or die "Can not fork: $!\n";
        unless ($pid) {
            exec ("date");
        }
    waitpid ($pid,0);

使用fork将会开启子进程与父进程同时执行之后的代码，其中父进程中fork会返回一个非零的数，而子进程中将返回零。上面的代码完成和system("date")相同的功能。比起system单纯地调用外部命令，fork可以完成更加复杂的进程操作。

    ## perl grep
    cat mm | perl -ne 'if(/comm/){print "$_\n"}'


大小写转换
\E  Terminate \L or \U conversion
\l  Convert next character to lowercase
\L  Convert all characters up to \E to lowercase
\u  Convert next character to uppercase
\U  Convert all characters up to \E to uppercase

