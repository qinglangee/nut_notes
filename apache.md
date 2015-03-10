  vim: ft=markdown
# 配置

## 最简单的域名配置

    <VirtualHost *:80>
    ServerName ppp.l99.com
    DocumentRoot /home/lifeix/Documents/apache_doc_root/ppp_root
    Rewriteloglevel 1
    Rewritelog /var/log/apache2/ppp.l99.rewrite.log
    </VirtualHost>

## 配置代理
proxy.conf

    ProxyRequests on
    ProxyVia On

    <Proxy *>
    Order deny,allow
    Deny from all
    Allow from all
    </Proxy>

# 其它

## ubuntu 重装
看这上面的，所以重装应该先:

    aptitude purge apache2 apache2.2-common

然后：

    aptitude install apache2 apache2.2-common

[重装apache2](http://www.vpsa.net/?post=40)


ubuntu下默认的docroot  /var/www

rewrite  转发
转发带参数
RewriteRule ^(0-9)$     /catalog/$1?%{QUERY_STRING}
http://httpd.apache.org/docs/2.2/mod/mod_rewrite.html



配置的一些错误处理:
注：
Syntax error on line 300 of /etc/apache2/apache2.conf:
Invalid command 'ProxyPass', perhaps misspelled or defined by a module not included in the server configuration
   ...fail!
发生以上错误表示我们配置了反向代理，但是没有打开module，所以执行一下命令，
打开module
cd /etc/apache2/mods-enabled
ln -s /etc/apache2/mods-available/proxy.conf proxy.conf
ln -s /etc/apache2/mods-available/proxy.load proxy.load
ln -s /etc/apache2/mods-available/proxy_http.load proxy_http.load

注意，其中得proxy.conf
<Proxy *>
      AddDefaultCharset off
      Order deny,allow
      deny from all
      #Allow from .example.com
</Proxy>
其中得deny from all需要改成allow from all
不然要报如下错误，不允许访问:
Forbidden
You don't have permission to access /video on this server.
--------------------------------------------------------------------------------
Apache/2.2.8 (Ubuntu) Server at 192.168.4.41 Port 80



http://fatal.blogbus.com/logs/43279046.html

下面是开启rewrite模块，比较简单

root@localhost:~$ sudo a2enmod rewrite

再重启下apache，就好用了，上面的default文件的AllowOverride None要改成All，才有效。MS是因为如果是None，会忽略.htaccess文件。

确实没啥技术含量，不断折腾。



http://ubuntu.blog.51cto.com/868790/185043

重启Apache2出现：Could not reliably determine the server's fully qualified domain name, using 127.0.1.1 for ServerName.问题
在/etc/apache2/apache2.conf文件最后加上：
# Server Name
ServerName XXXXXX


http://apps.hi.baidu.com/share/detail/3690627
解决方法一

这两天把自己的站点移到了Ubuntu 9.04底下，要弄伪静态的页面，需要启用Apache的rewrite模块。在其他的Linux版本中，这个问题似乎要容易解决一些，但是在ubuntu下，就有点不大一样。

需要通过命令，或者自己重新创建个软连接才可以。
命令是：sudo a2enmod rewrite
软连接是：sudo ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load

因为Ubuntu下，Apache的配置文件及目录结构不大一样，所以mods-avalilable下的是可用的模块，而真正启用了的模块是在mods-enable目录底下的。所以自己创建软连接也可以实现启用rewrite模块。

除了启用rewrite外，还有地方需要修改的，如果你的站点只有一个，那修改/etc/apache2/sites-available /default这个文件就可以，如果你是虚拟主机的，那就修改自己的/etc/apache2/sites-available /www.orioner.net.conf（我的虚拟主机配置文件）这个文件了。


查错
启动的时候就一直是the requested operation has failed错误.

于是开始检查：
运行-> cmd 进入到apache的bin目录。
输入httpd.exe -w -n "Apache" -k start
会提示配置文件的具体那行出错,找起来就方便多了。注：命令里的"Apache"是系统服务里apache服务的名称,及时换成你的。
