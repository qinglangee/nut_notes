# nutstore

## linux 下手工启动
执行括号里的命令就行了
`sh -c (sleep 30 && nohup ~/.nutstore/dist/bin/nutstore-pydaemon.py >/dev/null 2>&1) &`
linux 下　nutstore 可能会不小心自己挂掉，有时候连启动文件都没了，　用原来的安装包重新装一下就好了．
`sudo dpkg -i nautilus_nutstore_amd64.deb`
