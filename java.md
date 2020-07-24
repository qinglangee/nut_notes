  vim: ft=markdown
# java 常用
java 程序远程调试
java -Xdebug -Xrunjdwp:transport=dt_socket,server=y,address="8000" -jar ab.jar

eclipsｅ　中打开Debuge 配置界面, 新建一个Remote java Application

# java 编译低版本 class
`/jdk1.8/bin/javac -source 1.7 -target 1.7 T.java` 
虽然使用高版本的JDK可以通过指定编译source和target参数来兼容低版本JDK，但只是class文件格式上的，如果引用了高版本JRE库中某些方法一样会再低版本的JDK上报错；典型的例子就是java.util.concurrent.ConcurrentHashMap.keySet()这个方法！  
解决的办法是，编译使用对应的JDK，确保JRE的类库是对应版本。否则在意想不到的地方出现坑！  参考：http://stackoverflow.com/a/25705596

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