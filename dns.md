  vim: ft=markdown

# dns 命令
## windows 清dns缓存  

    $ ipcofig /flushdns

## linux 清dns缓存

    $ sudo /etc/init.d/dns-clean start
## linux 查看 dns

    $ cat /etc/resolv.conf
## 检查命令
使用命令检查（ping、dig、nslookup、named-checkzone、named-checkconf）

# dns 配置

##  linux下nameserver配置文件 
/etc/hosts：主机的一个列表文件，包含（本地网络中）已知主机的一个列表。如果系统的 IP 不是动态生成的，就可以使用它。
    /etc/host.conf：转换程序控制文件，告诉网络域名服务器如何查找主机名（通常是/etc/hosts，然后就是名称服务器。可通过netconf对其进行更改）。对于简单的主机名解析（点分表示法），在请求DNS或NIS网络名称服务器之前，/etc/hosts.conf 通常会告诉解析程序先查看这里。
    /etc/resolv.conf：转换程序配置文件，在配置程序请求BIND域名查询服务查询主机名称时必须告诉程序使用哪个域名服务器和IP地址来完成这个任务。
    Linux上的域名服务由named守护进程控制，该进程从主文件/etc/named.conf中获取信息，包括一组将主机名称映射为IP地址的各种文件。下面是named配置文件族的详细内容。
    /etc/named.conf：主文件，设置一般的name参数，指向该服务器使用的域数据库的信息源。
    /var/named/named.ca：根域名配置服务器指向文件，指向根域名配置服务器，用于告诉缓存服务器初始化。
    /var/named/localhost.zone：Localhost区正向域名解析文件，用于将本地IP地址（127.0.0.1）转换为回送方的Localhost名字。
    /var/named/name.local：Localhost区反向域名解析文件，用于将Localhost名字转换为本地回送IP地址（127.0.0.1）。
    /var/named/name2ip.conf：用户配置区的正向解析文件，将主机名映射为IP地址的区文件。
    /var/named/ip2name.conf：用户配置区的反向解析文件，将IP地址映射为主机名称的区文件。
