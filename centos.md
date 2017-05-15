  vim: ft=markdown  

# 安装
## 安装locate
    yum install mlocate
## 查看可用的安装包

    yum search java | grep -i --color JDK
## 查看哪个包提供了命令 ifconfig

    yum provides ifconfig
    yum whatprovides ifconfig
## rpm安装命令

    rpm -ivh xxx.rpm       # 安装rpm文件
    rpm -Uvh xxx.rpm       # 更新rpm文件


# 命令
## 查看系统版本
适用于所有linux系统

    # lsb_release -a
适用于centos

    # cat /etc/redhat-release
    # rpm -q redhat-release 
## 查看服务设置
关闭,开启服务的开机启动, 查看启动级别设置

    # chkconfig iptables on
    # chkconfig iptables off
    # chkconfig --list |grep iptables

## 服务重新载入
/etc/init.d  下的service 文件修改后要重新载入一下

    systemctl daemon-reload

## chkconfig

    # chkconfig --add  service_name
    # chkconfig --list service_name
