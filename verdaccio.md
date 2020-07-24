# Verdaccio 简单使用
Verdaccio  是 npm 的本地仓库开源软件

## 安装
npm install -g verdaccio  

## 启动 
verdaccio  

默认端口 4873   http://localhost:4873  

需要设置一下 npm 来使用这个服务 
`npm set registry http://localhost:4873/`





# nrm 
(npm registry manager )是npm的镜像源管理工具，有时候国外资源太慢，使用这个就可以快速地在 npm 源间切换  

## 添加镜像源
`nrm add verdaccio http://192.168.2.145:4873`
## 查看镜像源
`nrm ls`
## 切换镜像源
`nrm use versaccio`