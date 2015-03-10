  vim: ft=markdown
# 用法
*查看  jar --help 有简单例子和选项注释*

*指定Main-Class要在manifest文件中指定*

用配置文件mymanifest, 把 foo/ 目录中所有文件打包到 classes.jar :

       jar cvfm classes.jar mymanifest -C foo/ .

jar 打包 MANIFEST.MF文件的模板内容

    Manifest-Version: 1.0
    Class-Path: . time_lib/ognl-3.0.1.jar time_lib/lucene-analyzers-3.4.0. jar time_lib/tools.jar
    Main-Class: com.zhch.date.UtcTimeUtils
