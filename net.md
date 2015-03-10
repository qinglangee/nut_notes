  vim: ft=markdown
# linux 网络相关

## ifconfig
查看所有网卡

    ifconfig -a
启用, 停用网卡

    ifconfig eth0 up
    ifconfig eth0 down

## lspci - list all PCI devices
查看网卡型号

    lspci |grep "Ethernet controller"

## traceroute

## mtr
