  vim: ft=markdown
# 设置
设置maven java.home

设置refresh workspace

    windows -> Preferences -> General, 关掉refresh选项
安装EclipseMarket

    Help -> Install New Software, 选择版本号对应的站点,  General Purpose Tools → Marketplace Client

## eclipse version
eclipse Indigo Service Release 2    platform 3.7.2
eclipse Android Developer Tools     platform 4.2.1
eclipse Android is Juno             platform 4.2.1
eclipse Kepler Service Release 2    platform 4.3.2
eclipse Luna Release (4.4.0)        platform 4.4.0

indigo 之前主要用的
kepler 现在主要用的
luna   学习java8用的

## 查看错误日志 

    Help -> About Eclipse -> Installation Details -> Configuration -> View Error Log(在最下面)


## 你不知道的
[你不知道的Eclipse用法:使用Metrics 测量复杂度 ][1]  
[你不知道的Eclipse用法:使用PMD预先检测错误 ][2]  


# 报错

## Removing obsolete files from server... Could not clean server of obsolete files: null   
1. 有可能是tomcat_base中文件与eclipse中server config的不一致,删掉tomcat_base中的文件.
2. 双击Servers面板中的server 名字, 打开配置界面, 在Host name:一栏中, 如果hose name与server.xml 或 context.xml中指定的<host>的name属性不一致,会报这个错误


[1]: http://blog.csdn.net/p106786860/article/details/9230267
[2]: http://blog.csdn.net/p106786860/article/details/9193661
