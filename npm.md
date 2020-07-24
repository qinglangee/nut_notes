  vim: ft=markdown

# npm
## 简单命令
安装包

    npm install -g grunt   # -g 表示全局安装

删除已安装的包

    npm uninstall -g grunt
初始化一个package.json

    npm init

# 安装问题

## npm i 后目录里没东西
可能安装到上层目录去了，看一下上面的目录有没有 package.json 之类的文件。