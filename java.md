  vim: ft=markdown
# java 常用
java 程序远程调试
java -Xdebug -Xrunjdwp:transport=dt_socket,server=y,address="8000" -jar ab.jar

eclipsｅ　中打开Debuge 配置界面, 新建一个Remote java Application

## classpath 中包含 jar 包
windows 用;分隔， linux 用 : 分隔

	# windows
	java -cp "target/classes;target/dependency/activation-1.1.jar;target/dependency/antlr-2.7.7.jar" com.ison.server.DownloadParseMain 
	# linux 分隔符不同
	java -cp "target/classes:target/dependency/activation-1.1.jar:target/dependency/antlr-2.7.7.jar" com.ison.server.DownloadParseMain 

## 内存设置
-Xms128M
-Xmx512M 
-XX:PermSize=64M 
-XX:MaxPermSize=128M


# java 工具

1. housemd

HouseMD 是一款非常敏捷的Java进程运行时的诊断调式命令行工具 search -> taobao

2. java 反编译 

jad 命令行工具

java反编译工具, jd jd-core jd-gui jd-eclipse
http://jd.benow.ca/

3. assii码转换

native2ascii  直接回车输入文字回车就可以， 也可以命令后跟文件名
native2ascii  aa > bb   # 转换 aa 文件内容输入 bb 文件
native2ascii -reverse   # 内容反转