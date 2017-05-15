   vim: ft=markdown   
# 常用命令

## 安装ssh服务
ubuntu 默认没有sshd服务

    sudo apt-get install ssh

## 产生钥密钥,敲入命令按提示输入

    # -t 是 type, 不输入默认就是 rsa
    ssh-keygen -t rsa
    ssh-keygen -t rsa -C "myname@163.com"  # -C 是comment, 添加注释

## 免密码登录
进入客户机的`~/.ssh/`目录, 把 `id_rsa.pub`的内容cp到服务器的用户目录的`.ssh/authorized_keys` 文件中
命令实现

    ssh-copy-id root@192.168.1.121
指定文件

    ssh-copy-id -i id_rsa_l99.pub root@192.168.1.121
指定不使用授权文件登录, 如果在没有授权的机器上, 会尝试失败很多次, 然后被断掉
>Too many authentication failures for chengz

    ssh -o PubkeyAuthentication=no chengz@192.168.2.253

ssh-add
## ssh定时断开
可以在你本地的机器上 Linux：/etc/ssh/ssh_config 或 Mac： ~/.ssh/config 设置， ：

    Host *
    ServerAliveInterval 120
也可以在服务端设置，
在/etc/ssh/sshd_config中增加ClientAliveInterval 60, ClientAliveInterval指定了服务器端向客户端请求消息的时间间隔, 默认是0, 不发送.而ClientAliveInterval 60表示每分钟发送一次, 然后客户端响应, 这样就保持长连接了

## 测试 public key 在 github 上被哪个帐号用过了

    ssh -T -ai ~/.ssh/qinglang163 git@github.com
修改/etc/ssh/sshd_config文件，将ClientAliveInterval 0和ClientAliveCountMax 3的注释符号去掉,将ClientAliveInterval对应的0改成60
[避免ssh超时自动断开连接][1]

## 经常通过ssh 连接主机，其中一些创建 ssh 连接速度特别慢。

第一种情况:
解决的方法是通过ssh 的-v参数来查看调试信息的：

debug1: Next authentication method: publickey

原来是因为尝试了个没有意义而且会失败的 gssapi-with-mic 认证方式浪费了时间，
打开(远程服务器) /etc/ssh/ssh_config 把里面的 GSSAPIAuthentication yes 改成 no 关掉它。

第二种情况:
打开/etc/ssh/sshd_config ,查找 UseDNS yes, 改成no ,没有就添加一行
UseDNS no
然后 service sshd reload,  unbuntu下可能是 service ssh reload

## 更新主机的证书 known_hosts
如果ssh连接报错: WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!

    ssh-keygen -f  ~/.ssh/known_hosts -R 192.168.50.69
也可以直接到 ~/.ssh/known_hosts里删除相关IP的内容

## ssh执行命令

    ssh  user@192.168.0.22  "touch /tmp/aa && touch /tmp/bb"
## ssh proxy

    ssh -qTfnN -D 7070  sshproxy@106.185.27.168

## putty  tunnel设置

	切换到Connection -> SSH -> Tunnels ，设定Source port: 7575（端口号随你喜欢）; Destination: 空白, Dynamic，设定完记得按Add。

plink    proxy.bat

	PLINK.EXE -C -N -D 127.0.0.1:7070 sshproxy@106.185.27.168













======================================================================
经常通过ssh 或者 scp 连接一堆远程主机，同样是 Linux 主机，其中一些创建 ssh 连接速度特别慢，连接建立之后执行操作速度却很正常，看来应该不是网络原因。解决的方法是通过ssh 的-v参数来查看调试信息的：

用 ssh -v 来查看详细的连接建立过程，马上用一台建立连接很慢的主机试了一下，在一大堆输出信息中发现在这里停留最久:

debug1: Authentications that can continue: publickey,gssapi-with-mic,password
debug1: Next authentication method: gssapi-with-mic
debug1: Unspecified GSS failure. Minor code may provide more information
No credentials cache found

debug1: Unspecified GSS failure. Minor code may provide more information
No credentials cache found

debug1: Unspecified GSS failure. Minor code may provide more information

debug1: Next authentication method: publickey


原来是因为尝试了个没有意义而且会失败的 gssapi-with-mic 认证方式浪费了时间，打开(远程服务器) /etc/ssh/ssh_config 把里面的 GSSAPIAuthentication yes 改成 no 关掉它，即可让 ssh 直接尝试美妙的 publickey 认证方式。

禁用 GSSAPIAuthentication 前后建立 ssh 连接时间的对比:

view plaincopy to clipboardprint?
root@server:~$ time ssh root@192.168.10.1 exit

real 0m18.488s
user 0m0.004s
sys 0m0.008s
root@server:~$ time ssh root@192.168.10.1 exit

real 0m3.531s
user 0m0.016s
sys 0m0.000s


[1]: http://www.osedu.net/article/linux/2012-05-02/405.html
