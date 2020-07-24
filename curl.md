  vim: ft=markdown
# Using curl to automate HTTP jobs

# faq
## 下载https链接
 curl -O -L  https://github.com/....zip

# 1. HTTP Scripting
## 1.1 Background
## 1.2 The HTTP Protocol
## 1.3 See the Protocol
参数 --verbose (-v as a short option) 会显示 curl 发送了什么命令和一些其它信息。
--verbose 很管用，有时还不太够。那么 --trace 和 --trace-ascii 可以提供更多信息。

	curl --trace-ascii debugdump.txt http://www.example.com/
## 1.4 查看耗时
需要查看总耗时或某两个点之间的耗时时，可以用`--trace-time`参数，它会在跟踪输出后面添加时间:

	curl --trace-ascii d.txt --trace-time http://example.com/

## 1.5 查看响应

`curl` 默认输出到标准输出。 可以用 `-o 或 -O` 重定向. 
# 2 URL 
##2.1 Spec
The Uniform Resource Locator format is how you specify the address of a particular resource on the Internet. You know these, you've seen URLs like https://curl.haxx.se or https://yourbank.com a million times. RFC 3986 is the canonical spec. And yeah, the formal name is not URL, it is URI.
## 2.2 Host
The host name is usually resolved using DNS or your /etc/hosts file to an IP address and that's what curl will communicate with. Alternatively you specify the IP address directly in the URL instead of a name.
想改变域名的解析时，使用 --resolve 选项:

	curl --resolve www.example.org:80:127.0.0.1 http://www.example.org/
## 2.3 Port number
指定端口号，用冒号加数字:

	curl http://www.example.org:1234/
使用代理：

	curl --proxy http://proxy.example.org:4321 http://remote.example.org/
## 2.4 用户名和密码

Some services are setup to require HTTP authentication and then you need to provide name and password which then is transferred to the remote site in various ways depending on the exact authentication protocol used.
You can opt to either insert the user and password in the URL or you can provide them separately:

	curl http://user:password@example.org/
or

	curl -u user:password http://example.org/
这跟当前普遍使用的form表单提交的用户信息是不同的。
## 2.5 Path part
The path part is just sent off to the server to request that it sends back the associated response. The path is what is to the right side of the slash that follows the host name and possibly port number. 

refs:  
[Using curl to automate HTTP jobs](https://curl.haxx.se/docs/httpscripting.html)