  vim: ft=markdown  

# 安装
## 安装locate
    yum install mlocate
## rpm安装命令

    rpm -ivh xxx.rpm       # 安装rpm文件
    rpm -Uvh xxx.rpm       # 更新rpm文件


# 命令

## rpm 命令

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

