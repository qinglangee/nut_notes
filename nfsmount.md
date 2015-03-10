  vim: ft=markdown
# 挂载

    sudo mount -t nfs 192.168.1.17:/nfsdata/filedata /nfsdata/filedata
*ubuntu error*
Linux NFS Mount: wrong fs type, bad option, bad superblock on fs2:/data3 Error And Solution

    sudo apt-get install nfs-common

*centos error*
mount: wrong fs type, bad option, bad superblock on 192.168.2.13:/home/data,
       missing codepage or helper program, or other error

    yum install nfs-utils 

没有权限的话，修改/etc/export 加入相应的主机ip

    /nfsdata/filedata               192.168.50.124(rw,sync,no_root_squash,insecure)
    service nfs reload
--就可以了, 下面的不用
service roadmap reload ???

开机自动挂载
--->>
/etc/fstab 中添加下面一行, mount -a 执行/etc/fstab中的挂载

    192.168.1.17:/nfsdata/filedata /nfsdata/filedata nfs rw,hard,intr 0 0

    mount -a [-t|-O] ...     : mount all stuff from /etc/fstab

## 挂载iso文件

    sudo mount -o loop  aa.iso  /media/cdrom
    # 可读写的挂载
    sudo mount -o rw,loop aa.iso /media/cdrom
