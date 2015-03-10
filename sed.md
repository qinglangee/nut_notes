#! /bin/bash

# 参数 -i edit in place (直接编辑文件)

# 打印匹配模式的行
sed -n "/xyz/p" $filename

#要将目录/modules下面所有文件中的zhangsan都修改成lisi，这样做：
sed -i "s/zhangsan/lisi/g" `grep zhangsan -rl /modules`
http://bbs.linuxtone.org/thread-1731-1-1.html

#把文件中的http替成ftp
sed -i "s/http/ftp/g"  filename
#不区分大小写
sed -i "s/http/ftp/ig"  filename

# 把第5-7行的http替换成ftp
sed -i "5,7s/http/ftp/"  filename
