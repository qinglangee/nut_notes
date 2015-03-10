首先设置IP

sudo gedit /etc/network/interfaces

将其内容删除
加上一下内容
auto lo
iface lo inet loopback
auto etho
iface etho inet static
address 192.168.30.30
netmask 255.255.255.0
network 192.168.0.0
broadcast 192.168.30.255
gateway 192.168.0.1

sudo /etc/init.d/networking restart

保存
然后修改DNS
sudo gedit /etc/resolv.conf
将内容修改为
nameserver 202.103.24.68
nameserver 208.67.222.222
nameserver 208.67.220.220
保存
重启网络连接
sudo /etc/init.d/networking stop
sudo /etc/init.d/networking start



lifeix@lifeix-DX4840:~$ ifconfig
eth0      Link encap:Ethernet  HWaddr 44:87:fc:f9:30:db  
          inet addr:192.168.30.30  Bcast:192.168.30.255  Mask:255.255.255.0
          inet6 addr: fe80::4687:fcff:fef9:30db/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:103097 errors:0 dropped:0 overruns:0 frame:0
          TX packets:56661 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:118637060 (118.6 MB)  TX bytes:5954482 (5.9 MB)
          Interrupt:41 Base address:0xa000 

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:1355 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1355 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:115354 (115.3 KB)  TX bytes:115354 (115.3 KB)
