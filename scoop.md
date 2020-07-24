# windows 软件安装器
[比较详细的介绍][1]  
[scoop github](https://github.com/lukesampson/scoop)  

## 安装

```
# 先设置 PowerShell 允许执行未签名脚本
set-executionpolicy remotesigned -s currentuser
# 下载 Scoop 安装脚本进行安装
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
```

## 安装软件

scoop install git

配置安装全局软件到指定目录
Configure Scoop to install global programs to a Custom Directory by changing SCOOP_GLOBAL
```
$env:SCOOP_GLOBAL='F:\GlobalScoopApps'
[Environment]::SetEnvironmentVariable('SCOOP_GLOBAL', $env:SCOOP_GLOBAL, 'Machine')
# run the installer
```

refs:  




[1]: https://www.h404bi.com/blog/2018/05/talk-about-scoop-the-package-manager-for-windows-again#fn10