  vim: ft=markdown

## 问题
* 不能全屏  
安装驱动

## 安装驱动

* 安装virtualbox增强包  
打开虚拟机, 在菜单->Devices->Install Guest Additionals可以安装

## 命令行安装

    sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list'
    wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
    sudo apt-get update
    sudo apt-get install virtualbox-4.3
