有些软件不支持socks代理，只支持http代理。不像火狐那样都支持，于是有的时候要建http代理。

如果您有socks代理，想做一个http代理的话，这篇文章可能会有帮助。

我的情况是，有一个美国的主机，可以ssh上去建立socks代理，没有http代理。

在ruby gem的时候，经常挂掉，说没有rails这个gem，让人很是抓狂，于是尝试建http代理解决之。

 

用到的软件，privoxy，openssh。

原理是浏览器请求发给http代理privoxy，privoxy在将请求转发给socks代理，socks代理访问的internet。

 

1.建立socks代理。

要有ssh软件支援。
ssh d-wiki.org -D7979 -ldwikiorg

d-wiki.org是租的虚拟主机的域，7979是本地端口号，D参数是远程动态端口，-l参数是指定用户名。还可以加上其他的ssh参数，这几个必须。

这步完成以后就建立起了一个127.0.0.1:7979的socks代理，可以配置火狐等支持socks代理的软件那个了。

 

2.安装Privoxy。

Privoxy is a non-caching web proxy with advanced filtering capabilities for enhancing privacy, modifying web page data and HTTP headers, controlling access, and removing ads and other obnoxious Internet junk. Privoxy has a flexible configuration and can be customized to suit individual needs and tastes. It has application for both stand-alone systems and multi-user networks.

以上介绍引用自官网http://www.privoxy.org/

我用的是vmware workstation里的ubuntu，于是只要

 
apt-get install privoxy

安装完成后它自动启动。

 

3.配置Privoxy。

配置文件默认是/etc/privoxy/config。

编辑它增加一行：
forward-socks5 / 127.0.0.1:7979 .

forward-socks5代表转发到socks5代理，/代表所有的URL都转发(也可以在这里写url patten)，127.0.0.1:7979是socks代理的位置，最后的一点.代表没有http代理，具体请上官网查阅。

保存即生效。

现在的127.0.0.1:8118就是一个http代理了。8118是privoxy默认的端口。

 

现在gem install就不会出现找不到rails了，果然是那个的原因。

 

附之前一个失败的尝试：

我用putty在windows上建立了socks代理，用ccproxy的二级代理将请求转发给socks代理，理论上实行的通的。

但是发现vmware workstation和ccproxy有些奇怪的现象，比如虚拟机一请求ccproxy代理就连不上网，ping不同window，但是windows可以ping虚拟机。ubuntu和open suse都发现了这个情况。后来重装了vmware网络是正常了，ccproxy又不能工作了。于是暗自怀疑两者冲突。不知道真实的原因是什么，知道的话请分享
