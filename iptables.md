  vim: ft=markdown

# 查看
关闭,开启服务的开机启动, 查看启动级别设置

    # chkconfig iptables on
    # chkconfig iptables off
    # chkconfig |grep iptables
查看本机iptables配置

    # iptables -L -n
>  --list    -L [chain [rulenum]]
                List the rules in a chain or all chains
>  --numeric  -n  numeric output of addresses and ports          

# 配置
[linux下IPTABLES配置详解](http://www.cnblogs.com/JemBai/archive/2009/03/19/1416364.html)  
[9个常用iptables配置实例](http://www.cnblogs.com/bangerlee/archive/2013/02/27/2935422.html)  
1. 删除已有规则
2. 设置chain策略
3. 屏蔽指定ip
4. 配置服务项(开启某个端口)
5. 网口转发配置
7. DoS攻击防范
8. 配置web流量均衡
9. 将丢弃包情况记入日志

命令设置的配置就像用命令配置IP一样,重起就会失去作用,怎么保存.

    # /etc/rc.d/init.d/iptables save
这样就可以写到/etc/sysconfig/iptables文件里了.写入后记得把防火墙重起一下,才能起作用.  

    # service iptables restart
清除规则  

    # iptables -F        清除预设表filter中的所有规则链的规则
    # iptables -X        清除预设表filter中使用者自定链中的规则
对于基于udp的dns服务，使用以下命令开启端口服务：

    iptables -A OUTPUT -p udp -o eth0 --dport 53 -j ACCEPT
    iptables -A INPUT -p udp -i eth0 --sport 53 -j ACCEPT
如果做了WEB服务器,开启80端口.

    # iptables -A INPUT -p tcp --dport 80 -j ACCEPT




