# squid 代理服务器

## 常用命令

查看帮助 `squid --help`
查看版本  `squid -v`
重新加载配置  `squid -k reconfigure`
## 相关配置

[设置高匿名代理][1]

	#Squid 3.1
	via off
	forwarded_for delete

设置允许的ip

	# 定义自己的ip
	acl ownerip src 106.2.200.98
	acl ownerip src 103.23.25.26

	# 允许IP用户的请求
	http_access allow ownerip





[1]: http://ju.outofmemory.cn/entry/231842