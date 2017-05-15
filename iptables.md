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



# 配置文件
centos7 配置文件位置 `vim /etc/sysconfig/iptables` , 重启命令 `systemctl restart iptables.service`  


示例

    # sample configuration for iptables service
    # you can edit this manually or use system-config-firewall
    # please do not ask us to add additional ports/services to this default configuration
    *filter
    :INPUT ACCEPT [0:0]
    :FORWARD ACCEPT [0:0]
    :OUTPUT ACCEPT [0:0]
    -A INPUT -m state --state RELATED, ESTABLISHED -j ACCEPT
    -A INPUT -p icmp -j ACCEPT
    -A INPUT -i lo -j ACCEPT
    -A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
    -A INPUT -p tcp --dport 9312 -j ACCEPT
    # 开放端口
    -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
    -A INPUT -m state --state NEW -m tcp -p tcp --dport 8081 -j ACCEPT
    -A INPUT -j REJECT --reject-with icmp-host-prohibited
    -A FORWARD -j REJECT --reject-with icmp-host-prohibited


    # 拒绝掉其它的流量
    -A INPUT -j REJECT --reject-with icmp-host-prohibited
    -A FORWARD -j REJECT --reject-with icmp-host-prohibited

    COMMIT

## 命令行添加规则

    iptables -A INPUT  -p tcp --dport 8081 -j ACCEPT
    # -I 插入可以把规则插到靠前的位置，防止被前面的屏蔽掉  -I chain_name order_number
    iptables -I INPUT 1 -p tcp --dport 8081 -j ACCEPT
命令行添加的规则会立即生效，但 *规则链中的规则是有先后顺序的，接受的规则要放在【全部reject】规则之前才会生效*
# 语法
一般命令格式  `iptables [-t table] command [match] [target]`

## `[-t table]` 选项允许使用标准表之外的任何表。有三个可用的表选项：filter、nat和 mangle。如果未指定，则filter作为缺省表.三种表实现的功能：

* filter 用于一般的信息包过滤，包含 INPUT,OUTPUT 和 FORWARD 链
* nat 用于要转发的信息包，包含 PREROUTING, OUPTUT, POSTROUTING链
* mangle 包含一些规则来标记用于高级路由的信息包，包含PREROUTING 和 OUTPUT链。

## `command` 告诉 iptables 要做什么
常见命令：

* -A / --append 该命令将一条规则附加到链的末尾
    $ iptables -A INPUT -s 210.36.23.21 -j ACCEPT  该命将一条规则附加到INPUT链的末尾，确定来自源地址 210.36.23.21 的信息可以接收
* -D / --delete 通过用-D指定要匹配的规则或指定规则在链中的位置编号，该命令删除规则。
    $ iptables -D INPUT -dport 80 -j DROP
    $ iptables -D OUTPUT 3
    第一条从 INPUT 链删除规则， 它指定丢弃前往端口 80 的信息包。第二条命令从OUTPUT 链删除编号为3的规则
* -P / --policy 该命令设置链的缺省目标，即策略。所有与链中任何规则都不匹配的信息包将被强制使用此链的策略。
    $ iptables -P INPUT DROP
    该命令将INPUT链的缺省目标指定为DROP.
* -N / --new-chain 用命令中所指定的名称创建一个新链
    $ iptables -N allowed-chain
* -F / -- flush 如果指定链名，该 命令删除链中的所有规则；如果未指定链名，则删除所有链中的所有规则。此参数用于快速清除。
    $ iptables -F FORWARD
    $ iptables -F
* -L / --list  列出指定链中的所有规则

## `match` 匹配
iptables命令的可选match部分指定信息包与规则匹配所应具有的特征（如源地址、目的地址、协议等）。匹配分为通用匹配和特定于协议的匹配两大类。这里将介绍可用于采用任何协议的信息包的通用匹配。

* -p/--protocol 该通用协议匹配用于检查某些特定协议。协议示例有 TCP、UDP、ICMP。用逗号分隔的任何这三种协议的组合列表以及 ALL(用于所有协议)。ALL 是缺少匹配。可以使用 ! 表示不与该项匹配。
    $ iptables -A INPUT -p TCP,UDP
    $ iptables -A INPUT -p !ICMP
    这两个命令执行的是同一任务， 因为只有三个协议 
* -s /--source  用于匹配源IP地址。可以使用 ！ 表示不匹配。 还可以匹配 IP 范围
    $ iptables -A OUTPUT -s 192.168.1.1
    $ iptables -A OUTPUT -s 192.168.0.0/24
    $ iptables -A OUTPUT -s ! 203.16.1.89
    第二条匹配所有来自 192.168.0.0 到 192.168.0.24 的信息。
    第三条匹配所有不是来自 IP 203.16.1.89 的信息
* -d/--destination 
    $ iptables -A INPUT -d 192.168.1.1
    $ iptables -A INPUT -d 192.168.1.0/24
    $ iptables -A OUTPUT -d ! 203.16.1.89
## `target`目标

目标是由规则指定的操作，对与那些规则匹配的信息包执行这些操作。除了允许用户定义的目标之外，还有许多可用的目标选项。表4是常用的一些目标及示例说明。

除表4外，还有许多用于建立高级规则的其它目标，如LOG、REDIRECT、MARK、MIRROR和MASQUERADE等。

表4 目标及示例说明

* ACCETP  匹配的信息包会被接受
* DROP  匹配的信息包会被丢弃
* REJECT 工作方式与 DROP 相同，但比 DROP 好一些。REJECT 不会在服务器和客户机上留下死套接字。另外，REJECT 将错误消息发回给信息包的发送方。该目标被指定为 -j REJECT
    $ iptables -A FORWARD -p TCP --dport 22 -j REJECT
* RETURN 在规则中设置的 RETURN 目标让与该规则匹配的信息包停止遍历包含该规则的链。如果链是 INPUT 之类的主链， 则使用该链的缺省策略处理信息包，它被指定为 -jump RETURN .



# 配置
[linux下IPTABLES配置详解][2]  
[9个常用iptables配置实例][3]  
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




refs:  
[防火墙配置文件iptables详解][1]  
[iptables 手册][4]  

[1]: http://wenku.baidu.com/view/ad7c7f6a1eb91a37f1115c41.html
[2]: http://www.cnblogs.com/JemBai/archive/2009/03/19/1416364.html
[3]: http://www.cnblogs.com/bangerlee/archive/2013/02/27/2935422.html
[4]: http://www.iptables.info/en/iptables-matches.html
