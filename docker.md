# docker 操作

## 使用
指定端口名字启动容器

	docker run -d -p 9080:9080 --name web training/webapp python app.py
清理后台所有停止的容器

	docker ps -a -q | xargs docker rm
## 共享目录

	$ sudo docker run -d -P --name web -v /webapp -v /abcd -v /def training/webapp python app.py  # 多次创建多个数据卷
	$ sudo docker run -d -P --name web -v /src/webapp:/opt/webapp training/webapp python app.py   # 挂载主机目录
Docker 挂载数据卷的默认权限是读写，用户也可以通过 :ro 指定为只读。

	$ sudo docker run -d -P --name web -v /src/webapp:/opt/webapp:ro training/webapp python app.py

## 构建

	$ sudo docker build -t="ouruser/sinatra:v2" .
标签添加

	$ sudo docker tag 5db5f8471261 ouruser/sinatra:devel

## 其它
查询 centos image

	docker search centos