  vim: ft=markdown
# linux 工具命令

## md5 sha1 hash 
计算MD5

    md5sum  [filename]
计算 sha1

    sha1sum [filename]

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

    find -type f .   

find . -size +90000c   #查找size在 9000字节以上的文件

比较两个文件时间

    # 如果 aa 比 bb 新, file的值是aa, 否则file值为空
    file=`find aa -newer bb`
    if [ "$newer" == "$1" ];then...else...fi
查看特定类型的文件

    find -name '*.xml' -exec grep b  {} \; -print


### 如何方便地删除某目录下所有空文件？
find . -size 0 -exec rm {} \;或find . -size 0 | xargs rm -f
find默认会递归遍历所有子目录，如果想只在当前目录查找，可以添加参数-prune。

## grep
从配置文件中取值,赋值给变量 ZOO_LOG_DIR
dataDir=/home/lifeix/temp/appdata/zookeeper

    ZOO_LOG_DIR=$(grep "^[[:space:]]*dataDir" "$ZOOCFG" | sed -e 's/.*=//')

## echo 
使输出显示在一行

    echo -n  1234
## trap命令
trap 'command' signal
trap  'echo line error:$LINENO  status:$?' ERR

通过DEBUG信号量打印变量的值
trap 'echo “before execute line:$LINENO, a=$a,b=$b,c=$c”' DEBUG

## 使用tee命令
tee命令会从标准输入读取数据，将其内容输出到标准输出设备,同时又可将内容保存成文件

    ipaddr=`/sbin/ifconfig | grep 'inet addr:' | grep -v '127.0.0.1'| tee temp.txt | cut -d : -f3 | awk '{print $1}'`
在一个长的shell脚本中, 如果管道之间依靠一些脚本中的变量, 可以用tee方便地查看中间命令的输出

