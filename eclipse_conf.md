1.server tomcat6
2.maven
3.ctrl+up down copy lines/Duplicate lines   alt+j Content Assist
4.jsp xml assosilate
5.debug panel
6.zhtest template

7.0. code style -> line wrapping   120, Tab Policy: space only / 4:q

7.1. formate  @param后面不换行
7.2. blank line before javadoc tag  去掉

8.去掉templet 里的syserr
9.Ctrl+h search 只保留File search
10.find  incremental
11.save action  -> ctrl+o
12.不设置debug panel,正常panel中加入
debug,
outline,breakpoint,variable,
console,servers
13.下一个anotation, 去掉warning(工具栏的 next anotation图标右边有个下拉箭头，把里面的 warning 前的勾去掉)
14. 配置validation相关内容



zhtest

public void test(){
 ${cursor}
}
public static void main(String[] args) {
    ${enclosing_type} t = new ${enclosing_type}();
    t.test();
}

pubb 构造函数

public ${enclosing_type}() {
    ${cursor}
}




插件安装
testng
http://beust.com/eclipse    org.testng.eclipse_6.4.0.20120308_1617.jar

zencoding
https://github.com/sergeche/eclipse-zencoding

color theme 颜色管理 （market 搜索）
