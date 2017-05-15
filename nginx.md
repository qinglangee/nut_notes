  vim: ft=markdown
# nginx 命令
 配置测试 and 重载

    service nginx configtest
    service nginx reload


# nginx 配置
## location 配置中 root 与 alias 的区别

如下配置  www.abc.com/static/aa.js 就会访问 /srv/web/static/aa.js文件

    location /static {
        root  /srv/web/
    }
如下配置  www.abc.com/static/aa.js 也会访问 /srv/web/static/aa.js文件

    location /static {
        alias  /srv/web/static
    }

上传文件大小 

	client_max_body_size 10M