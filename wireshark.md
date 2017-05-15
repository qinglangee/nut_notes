# wireshark 用法示例

http://openmaniak.com/cn/wireshark_filters.php#capture
http://fangxin.blog.51cto.com/1125131/735178
http://9916376.blog.51cto.com/468239/759981

## 权限说明　
这个文件中有说明，debian/ubuntu系统中怎么设置非root用户运行wireshark.
`/usr/share/doc/wireshark-common/README.Debian`

## 捕捉过滤器
语法: Protocol  Direction  Host    Value  LogicalOperatiions  Other expression
例子:  tcp       dst       aa.com  80       and               tcp dst bb.com

Protocol（协议）:
可能的值: ether, fddi, ip, arp, rarp, decnet, lat, sca, moprc, mopdl, tcp and udp.
如果没有特别指明是什么协议，则默认使用所有支持的协议。

Direction（方向）:
可能的值: src, dst, src and dst, src or dst
如果没有特别指明来源或目的地，则默认使用 “src or dst” 作为关键字。
例如，`host 10.2.2.2`与`src or dst host 10.2.2.2`是一样的。

Host(s):
可能的值： net, port, host, portrange.
如果没有指定此值，则默认使用”host”关键字。
例如，`src 10.1.1.1`与`src host 10.1.1.1`相同。

Logical Operations（逻辑运算）:
可能的值：not, and, or.
否(“not”)具有最高的优先级。或(“or”)和与(“and”)具有相同的优先级，运算时从左至右进行。
例如，
`not tcp port 3128 and tcp port 23`与`(not tcp port 3128) and tcp port 23`相同。
`not tcp port 3128 and tcp port 23`与`not (tcp port 3128 and tcp port 23)`不同


例子：

`tcp dst port 3128`  //捕捉目的TCP端口为3128的封包。
`ip src host 10.1.1.1`  //捕捉来源IP地址为10.1.1.1的封包。
`host 10.1.2.3`  //捕捉目的或来源IP地址为10.1.2.3的封包。
`ether host e0-05-c5-44-b1-3c` //捕捉目的或来源MAC地址为e0-05-c5-44-b1-3c的封包。如果你想抓本机与所有外网通讯的数据包时，可以将这里的mac地址换成路由的mac地址即可。
`src portrange 2000-2500`  //捕捉来源为UDP或TCP，并且端口号在2000至2500范围内的封包。
`not imcp`  //显示除了icmp以外的所有封包。（icmp通常被ping工具使用）
`src host 10.7.2.12 and not dst net 10.200.0.0/16` //显示来源IP地址为10.7.2.12，但目的地不是10.200.0.0/16的封包。
`(src host 10.4.1.12 or src net 10.6.0.0/16) and tcp dst portrange 200-10000 and dst net 10.0.0.0/8`  //捕捉来源IP为10.4.1.12或者来源网络为10.6.0.
`0/16`，目的地TCP端口号在200至10000之间，并且目的位于网络 10.0.0.0/8内的所有封包。
`src net 192.168.0.0/24 `
`src net 192.168.0.0 mask 255.255.255.0`  //捕捉源地址为192.168.0.0网络内的所有封包。

注意事项：

当使用关键字作为值时，需使用反斜杠“/”。
“ether proto /ip” (与关键字”ip”相同).
这样写将会以IP协议作为目标。

“ip proto /icmp” (与关键字”icmp”相同).
这样写将会以ping工具常用的icmp作为目标。

可以在”ip”或”ether”后面使用”multicast”及”broadcast”关键字。
当您想排除广播请求时，”no broadcast”就会非常有用。

Protocol（协议）:
您可以使用大量位于OSI模型第2至7层的协议。点击”Expression…”按钮后，您可以看到它们。
比如：IP，TCP，DNS，SSH

String1, String2 (可选项):

协议的子类。
点击相关父类旁的”+”号，然后选择其子类。

Comparison operators （比较运算符）:
可以使用6种比较运算符：
英文写法  C语言写法  含义
eq         ==
ne          !=
gt            >
lt           <
ge          >=
le           <=



Logical e­xpressions（逻辑运算符）:
and    &&
or     ||
xor    ^^
not     !

## 显示过滤器
语法  Protocol.String 1.String 2 ComparisonOperator  Value  LogicalOP  Other
例子   ftp      passive   ip       ==               aa.com   xor       icmp.type


例子：
`http.host contains "zhaopingou.com"` // 显示域名包含 zhaopingou.com 的封包
`snmp || dns || icmp` //显示SNMP或DNS或ICMP封包。
`ip.addr == 10.1.1.1`  //显示来源或目的IP地址为10.1.1.1的封包。
`ip.src != 10.1.2.3 or ip.dst != 10.4.5.6`  //显示来源不为10.1.2.3或者目的不为10.4.5.6的封包。
换句话说，显示的封包将会为：
来源IP：除了10.1.2.3以外任意；目的IP：任意
以及
来源IP：任意；目的IP：除了10.4.5.6以外任意
`ip.src != 10.1.2.3 and ip.dst != 10.4.5.6`  //显示来源不为10.1.2.3并且目的IP不为10.4.5.6的封包。
换句话说，显示的封包将会为：
来源IP：除了10.1.2.3以外任意；同时须满足，目的IP：除了10.4.5.6以外任意
`tcp.port == 25`  //显示来源或目的TCP端口号为25的封包。
`tcp.dstport == 25`  //显示目的TCP端口号为25的封包。
`tcp.flags`  //显示包含TCP标志的封包。
`tcp.flags.syn == 0×02`  //显示包含TCP SYN标志的封包。
如果过滤器的语法是正确的，表达式的背景呈绿色。如果呈红色，说明表达式有误。
更为详细的说明请见：http://openmaniak.com/cn/wireshark_filters.php

以上只是抓包和简单的过滤，那么其实如果你要想达到能够分析这些网络包的要求时，还需要了解下一些数据包的标记，比如我们常说的TCP三次握手是怎么回事？
