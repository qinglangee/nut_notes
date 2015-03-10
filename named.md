wireless17中ip的配置
ssh root@192.168.1.11
cd /var/named/chroot/etc
vim named.conf    找到wireless17test, 找到它的配置文件 wireless17test.def
cd ../var/named/  (/var/named/chroot/var/named)
vim wireless17test.def   找到 zone "l99.com", 找到定义文件, 进去改配置
service named reload
