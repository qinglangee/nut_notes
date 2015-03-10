连接
smbclient   //192.168.30.95/work -U lifeix
copy 文件
get filename  [localfilename]


挂载windows目录
sudo apt-get install smbfso

sudo mount   -t   smbfs   -o   username=Lifeix,password=Lifeix   //192.168.30.95/work   /home/lifeix/temp/d3
取消挂载

sudo umount /home/lifeix/temp/d3

