  vim: ft=markdown
# linux 工具命令

## md5 sha1 hash 
计算MD5

    md5sum  [filename]
计算 sha1

    sha1sum [filename]
计算 pgp

    gpg --verify apollo.tar.gz.asc
apollo.tar.gz.asc 是签名文件，生成签名文件的文件（即要被验证的文件）必须在同一目录中，文件名只比签名少 ".asc" 后缀。当没有公钥时，会返回
>gpg: Signature made Thu 29 Jan 2015 11:55:12 PM CST using DSA key ID F5BA7E4F
gpg: Can't check signature: No public key

然后根据公钥钥匙号`F5BA7E4F`去公钥服务器中下载公钥。可用的公钥服务器可以通过wikipedia 上的Key Server条目来查看常用的一些key服务器列表。这里使用hkp://pgp.mit.edu

    $ gpg --keyserver hkp://pgp.mit.edu --recv-keys 47ACDAFB
下载完后重新验证就行了

[Linux下校验下载文件的完整性(MD5,SHA1,PGP)][8]  

## zip  unzip
*zip*
替换压缩包内文件, 假设要更新zip根目录下的js目录下的example.js文件，则运行以下命令

    zip -u test.zip js/example.js /tmp/example.js
在 更新 jar包内的文件时, 实际两个目录一样才更新成功, 要建立相同目录

    zip -u test.jar js/aa.js  js/aa.js
    zip -u test.jar js/aa.js  js/aa.js
删除一个文件

    zip -d zipfile  path/to/file
*unzip*
查看解压包内容, 不解压

    unzip -l  filename

## find
结果只显示文件,  f 表示只显示文件  

    find . -type f 
    find /tmp  -type f

    find . -size +90000c   #查找size在 9000字节以上的文件
指定查找深度

    find workspace* -maxdepth 1   # 参数要放后边

比较两个文件时间

    # 如果 aa 比 bb 新, file的值是aa, 否则file值为空
    file=`find aa -newer bb`
    if [ "$newer" == "$1" ];then...else...fi
查看特定类型的文件

    find -name '*.xml' -exec grep b  {} \; -print
删除　find 找到的文件

    find aa |xargs rm


### 如何方便地删除某目录下所有空文件？
find . -size 0 -exec rm {} \;或find . -size 0 | xargs rm -f
find默认会递归遍历所有子目录，如果想只在当前目录查找，可以添加参数-prune。

## xargs
删除aa目录中与bb目录同名的文件  

    ls bb |xargs -i rm ~/temp/d3/aa/{}

目录中文件重命名,加上.bak( -t 表示先打印出命令)

    ls |xargs -t -i mv {} {}.bak
相当于 `ls |xargs -t -I{} mv {} {}.bak` , -I 需要显式地指定替代字符串， -i 已经不推荐使用了， 用 -I 代替。 
*-I 指定的代替字符串不能是通配符,小括号等特殊字符。中括号和大括号可以*

## rename
文件重命名
>rename --help
call: rename from to files...

    rename  aaa bbb  *.aaa  # 替换内容
    rename .bak ""  *.bak   # 去掉.bak后缀

## grep
从配置文件中取值,赋值给变量 ZOO_LOG_DIR
dataDir=/home/lifeix/temp/appdata/zookeeper

    ZOO_LOG_DIR=$(grep "^[[:space:]]*dataDir" "$ZOOCFG" | sed -e 's/.*=//')
查看特定类型的文件

    grep -R --include="*.cpp" aaabbb  ./src
同样的功能, 用find的exec参数

    find -name '*.xml' -exec grep b  {} \; -print

## echo 
使输出显示在一行

    echo -n  1234
## trap命令
trap 'command' signal
trap  'echo line error:$LINENO  status:$?' ERR

通过DEBUG信号量打印变量的值
trap 'echo “before execute line:$LINENO, a=$a,b=$b,c=$c”' DEBUG
## sort uniq
排序 & 去重

    sort  content.txt | uniq -c | sort -nr
sort 
    -n 转换成数字排序，否则 11 会排在 2 的前面
    -r 反转结果
uniq 
    -c 对重复的行计数
    -d 只显示有重复的行

## split  cat 文件分割与合并 [Linux Tar Split压缩解压缩分片压缩解压缩][1]

    split -l 5000  test.txt   # 切分文件，每个 5000 行， 默认每个 1000行
    split -b 100m test.txt    # 切分文件，每个 100M 
    
    split -b 4000k skype_backup.tar.gz skype_backup.tar.gz.

    cat skype_backup_20090626.tar.gz.a* >skype_backup_cat.tar.gz

>Usage: split [OPTION]... [INPUT [PREFIX]]
Output fixed-size pieces of INPUT to PREFIXaa, PREFIXab, ...; default
size is 1000 lines, and default PREFIX is `x`.  With no INPUT, or when INPUT
is -, read standard input.

>Mandatory arguments to long options are mandatory for short options too.
  -a, --suffix-length=N   use suffixes of length N (default 2)
  -b, --bytes=SIZE        put SIZE bytes per output file
  -C, --line-bytes=SIZE   put at most SIZE bytes of lines per output file
  -d, --numeric-suffixes  use numeric suffixes instead of alphabetic
  -l, --lines=NUMBER      put NUMBER lines per output file
      --verbose           print a diagnostic just before each
                            output file is opened
      --help     display this help and exit
      --version  output version information and exit

>SIZE may be (or may be an integer optionally followed by) one of following:
KB 1000, K 1024, MB 1000*1000, M 1024*1024, and so on for G, T, P, E, Z, Y.


## ldconfig  [ldconfig命令简介][2]
ldconfig命令的用途,主要是在默认搜寻目录(/lib和/usr/lib)以及动态库配置文件`/etc/ld.so.conf`内所列的目录下,搜索出可共享的动态链接库(格式如前介绍,`lib*.so`),进而创建出动态装入程序(ld.so)所需的连接和缓存文件.缓存文件默认为`/etc/ld.so.cache`,此文件保存已排好序的动态链接库名字列表. 

ldconfig通常在系统启动时运行,而当用户安装了一个新的动态链接库时,就需要手工运行这个命令. 

## tee
tee
　　功能说明：读取标准输入的数据，并将其内容输出成文件
列出文本文件slayers.story的内容，同时复制3份副本，文件名称分别为ss-copy1、ss-copy2、ss-copy3：

    $ cat slayers.story |tee ss-copy1 ss-copy2 ss-copy3
tee命令会从标准输入读取数据，将其内容输出到标准输出设备,同时又可将内容保存成文件

    ipaddr=`/sbin/ifconfig | grep 'inet addr:' | grep -v '127.0.0.1'| tee temp.txt | cut -d : -f3 | awk '{print $1}'`
在一个长的shell脚本中, 如果管道之间依靠一些脚本中的变量, 可以用tee方便地查看中间命令的输出

## date
date 输出格式， 查看 `date --help`

    date +"%Y-%m-%d"     # + 号后面不能有空格
    date +"%Y%m%d"
    date +%Y-%m-%d     # 没有引号也可以
    date "+%Y-%m-%d %T"     # 中间有空格就必须加引号
输出昨天的时间

    date -d yesterday

## xdg-open
使用文件的默认打开软件打开文件　`xdg-open  filename`
指定文件的默认软件　`mimeopen -d $file.pdf`, 选择指定的软件，以后就是默认软件了．[stackoverflow][9]

## curl 
跟随302,3xx重定向

    curl -L http://www.example.com
设置 header

    curl -H 'Host: 157.166.226.25' -H 'Accept-Language: es' -H 'Cookie: ID=1234' http://cnn.com
使用代理访问  `curl -x "12.12.12.12:8888" http://www.baidu.com`
post 数据     `curl --data "birthyear=1905&press=%20OK%20"  http://www.example.com/when.cgi`
post 数据 json 格式    `curl --connect-timeout 15 -H "Content-Type: application/json" -sd '{"data":"data"}' http://aaa.com/aaa`

参数

`-L, --location`      Follow redirects (H)                                      跟随重定向
`--location-trusted`  like --location and send auth to other hosts (H)
`-s, --silent`        Silent mode.                                              不输出任何内容
`-I, --head`          Show document info only                                   只输出头信息
`-H, --header  LINE`  Custom header to pass to server (H)                       自定义请求头
`-x, --proxy`         [PROTOCOL://]HOST[:PORT]  Use proxy on given port         使用代理访问
`-d, --data DATA`     HTTP POST data (H)

## wget [[转]wget用法详解][3]  [每天一个linux命令（61）：wget命令][4]
先介绍几个参数：-c 断点续传（备注：使用断点续传要求服务器支持断点续传），-r 递归下载（目录下的所有文件,包括子目录），-np 递归下载不搜索上层目录，-k 把绝对链接转为相对链接，这样下载之后的网页方便浏览。-L 递归时不进入其他主机，-p 下载网页所需要的所有文件。

比如：#wget -c -r -np -k -L -p http://www.kuqin.com/itman/liyanhong/ 下载酷勤网下面的目录“李彦宏”


-r 递归下载,慎用  `wget -r  http://www.baidu.com`
    按目录保存，递归时就会按目录保存   `wget -r http://www.cnblogs.com/tintin1926/archive/2012/07/12/2587311.html`
    如果这个网站引用了其他网站，那么被引用的网站也会被下载下来！基于这个原因，这个参数不常用。
-l 可以用`-l number`参数来指定下载的层次。例如只下载两层，那么使用-l 2

如果我们想下载ftp里面某个目录里面的所有文件，如 `wget -r ftp://10.8.8.8/movie/`
呵呵，等吧！下完了，发觉有些不对劲，怎么出来个10.8.8.8的目录，进去看看，又是一个movie，哦，wget将目录结构和网站标题都给记录下来了，不要？？没有问题！比如说还是这个例子
-nd  没有目录，一个都没有 `wget -r -nd ftp://10.8.8.8/movie/` 结果什么目录都没有了，faint！怎么会这样？呵呵，
-nH  没有 host 的目录， 你如果想要这样就让它这样吧，否则使用  `wget -r -nH ftp://10.8.8.8/movie/` 
-cut-dirs=n  去掉n层目录   恩？movie也不要？OK，那就这样 `wget -r -nH –cut-dirs=1 ftp://10.8.8.8/movie/`

断了线能连吗？呵呵，可以连
-c,  --continue  断点续传   `wget -c -r -nH –cut-dirs=1 ftp://10.8.8.8/movie/`  
-k 表示将连接转换为本地连接。 `wget -r -l2 -k http://www.ctan.org/tex-archive/macros/latex/`
-R 拒绝下载的扩展名列表， 逗号分隔  `wget -r -R “.htm?*” -k http://www.ctan.org/tex-archive/macros/latex/`
-A 表示仅仅接受的文件类型，如-A `“*.gif”`将仅下载gif图片
-nc, --no-clobber  跳过重复的下载  `wget -nc -r -k http://www.ctan.org/tex-archive/macros/latex/` 
-np don't ascend to the parent directory 忽略父目录  `wget -nc -np -r -k http://www.ctan.org/tex-archive/macros/latex/`
-H  可以在不同host之间跳转   `wget -nc -np -H -r -k http://www.ctan.org/tex-archive/macros/latex/`

-i,  --input-file=FILE  如果文件里全是链接，从文件的链接里下载   download URLs found in local or external FILE.   `wget -i your.file`
-F,  --force-html  把文件当作html处理  treat input file as HTML  `wget -F -i your.file`

下载ftp

    wget    --ftp-user=xiaoxin --ftp-password=54321   -r ftp://10.10.10.10/tool/smc20

## cron 定时器
服务重启 `service crond start` 或者有的系统是  `service cron start`
编辑定时器  `crontab -e`

    m h  dom mon dow   command
    * *   *   *   *     /usr/bin/bash
    分 小时 日 月  周几   命令

For example, you can run a backup of all your user accounts at 5 a.m every week with: `0 5 * * 1 tar -zcf /var/backups/home.tgz /home/`
*For more information see the manual pages of crontab(5) and cron(8)* 

## nohup 
`nohup  some_app &`  后台运行程序，不挂起
重定向输出文件　`nohup some_app >> /tmp/nohup.log 2>&1 &`

在shell中,文件描述符通常是:STDIN标准输入,STDOUT标准输出,STDERR标准错误输出,即:0,1,2,
例子：`nohup abc.sh > nohup.log 2>&1 &`
其中2>&1  指将STDERR重定向到前面标准输出定向到的同名文件中，即&1就是nohup.log
那么结果就是当执行的命令发生标准错误，那么这个错误也会输出到你指定的输出文件中 





# ===========================================
# ===========================================
# ===========================================
# ===========================================
下面是网络相关的

## ip
代替 ifconfig 的工具, [两代命令对比][6]和[中文的不具名转载][5]

`ip addr`  查看网卡详情 
`ip -s link`  查看统计数据

启用和禁用网卡

    ifconfig eth0 up
    ip link set eth0 up

    ifconfig eth0 down
    ip link set eth0 down
## ss
代替 netstat, [一些替换命令][7]

## nc
查看端口是否打开

    nc -v host port





refs:  
[How to properly and easy configure `xdg-open` without any enviroment?][9]  

[1]: http://www.xuebuyuan.com/1673460.html
[2]: blog.csdn.net/Destina/article/details/6208319
[3]: http://www.caojunfei.com/?p=107
[4]: http://www.cnblogs.com/peida/archive/2013/03/18/2965369.html
[5]: http://blog.csdn.net/muye0503/article/details/9184821
[6]: https://tty1.net/blog/2010/ifconfig-ip-comparison_en.html
[7]: http://inai.de/2008/02/19
[8]: http://www.tuicool.com/articles/Q3QNru
[9]: https://unix.stackexchange.com/questions/36380/how-to-properly-and-easy-configure-xdg-open-without-any-enviroment