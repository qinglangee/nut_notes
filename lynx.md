## lynx 使用说明
配置文件位置
/etc/lynx-cur/lynx.cfg

## 常用命令

*操作t*
d : 下载当前链接
g : 跳转到新链接
/：   在当前页内查找字符串。  
n：   搜索下一个。

*历史*
V：   跳转到访问过的地址。 
[backspace]：  跳转到历史页(同   V   命令)。 

*帮助*
k：   显示键盘命令列表。  


滚动命令：  
+,Page-Down,Space,Ctrl+f：   向下翻页。  
-,Page-Up,b,Ctrl+b：  向上翻页。  
Ctrl+a：   移动到当前页的最前面。  
Ctrl+e：   移动到当前页的最后面。  
Ctrl+n：   向下翻两行。  
Ctrl+p：   往回翻两行。  
)：   向下翻半页。  
(：   往回翻半页。 




Lynx

(一)   Lynx   简介  
　　Lynx   是一个字符界面下的全功能的WWW浏览器。Lynx   可以运行在很多种   操作系统下，如VMS,   UNIX,   Windows   95,   Windows   NT等，当然也包括Linux。   由于没有漂亮的图形界面，所以   Lynx   占用资源极少，而且速度很快。另外   Lynx   还是唯一能在字符终端下运行的   WWW   浏览器。  

　　Lynx   的主页地址是：http://lynx.browser.org   ，   另外   http://www.cc.ukans.edu/lynx_help/Lynx_users_guide.html   是   Lynx   的用户指南。  


(二)   运行   Lynx  
　　可以以   lynx   filename   和   lynx   PROTOCOL://HOST/PATH/FILENAME   的形式   运行   Lynx   ，其中前一种用于浏览本地文件，后一种用于浏览   Internet。   协议(PROTOCOL)，可以是   http,   gopher,   ftp   和   wais。如：  

HTTP   (HyperText   Transfer   Protocol)  
http://kuhttp.cc.ukans.edu/lynx_help/lynx_help_main.html  
Gopher  
gopher://gopher.micro.umn.edu/11/  
FTP   (File   Transfer   Protocol)  
ftp://ftp2.cc.ukans.edu/pub/lynx/README  
WAIS   (Wide   Area   Information   Service   protocol)  
wais://cnidr.org/directory-of-servers  


如果不带任何参数运行   Lynx，则   Lynx   会先寻找一个叫   WWW_HOME   的环境变量，如果找到的话，就会连接   WWW_HOME   指定的   URL。   WWW_HOME   变量的设置方法是，在bsh   和   ksh下：  

export   WWW_HOME=http://www.w3.org/default.html  

csh   下：  

setenv   WWW_HOME   http://www.w3.org/default.html  

如果   WWW_HOME   变量未指定的话，Lynx   则连接它的主页：http://lynx.browser.org/  


(三)   Lynx   的键盘命令  

移动命令：  
下方向键：页面上的下一个链接(用高亮度显示)。  
上方向键：页面上的前一个链接(用高亮度显示)。  
回车和右方向键：  
跳转到链接指向的地址。  
左方向键：回到上一个页面。  

滚动命令：  
+,Page-Down,Space,Ctrl+f：   向下翻页。  
-,Page-Up,b,Ctrl+b：  向上翻页。  
Ctrl+a：   移动到当前页的最前面。  
Ctrl+e：   移动到当前页的最后面。  
Ctrl+n：   向下翻两行。  
Ctrl+p：   往回翻两行。  
)：   向下翻半页。  
(：   往回翻半页。  
#：   回到当前页的   Toolbar   或   Banner。  

文件操作命令：  

c：   建立一个新文件。  
d：   下载选中的文件。  
E：   编辑选中的文件。  
f：   为当前文件显示一个选项菜单。  
m：   修改选中文件的名字或位置。  
r：   删除选中的文件。  
t：   Tag   highlighted   file。  
u：   上载一个文件到当前目录。  

其他命令：  

?,h：   帮助。  
a：   把当前链接加入到一个书签文件里。  
c：   向页面的拥有者发送意见或建议。  
d：   下载当前链接。  
e：   编辑当前文件。  
g：   跳转到一个用户指定的URL或文件。  
G：   编辑当前页的URL，并跳转到这个URL。  
i：   显示文档索引。  
j：   执行预先定义的“短”命令。  
k：   显示键盘命令列表。  
l：   列出当前页上所有链接的地址。  
m：   回到首页。  
o：   设置选项。  
p：   把当前页输出到文件，e-mail，打印机或其他地方。  
q：   退出。  
/：   在当前页内查找字符串。  
s：   在外部搜索输入的字符串。  
n：   搜索下一个。  
v：   查看一个书签文件。  
V：   跳转到访问过的地址。  
x：   不使用缓存。  
z：   停止当前传输。  
[backspace]：  
跳转到历史页(同   V   命令)。  
=：   显示当前页的信息。  
：   查看当前页的源代码。  
!：   回到shell提示符下。  
_：   清除当前任务的所有授权信息。  
*：   图形链接模式的切换开关。  
@：   8位传输模式或CJK模式的切换开关。  
[：   pseudo_inlines   模式的切换开关。  
]：   为当前页或当前链接发送一个“HEAD”请求。  
Ctrl+r：   重新装如当前页并且刷新屏幕。  
Ctrl+w：   刷新屏幕。  
Ctrl+u：   删除输入的行。  
Ctrl+g：   取消输入或者传送。  
Ctrl+t：   跟踪模式的切换开关。  
;：   看   Lynx   对当前任务的跟踪记录。  
Ctrl+k：   调用   Cookie   Jar   页。  
数字键：   到后面的第   n   个链接。   


lynx显示中文问题。
安装lynx后，只能显示英文，如果登录中文网站显示乱码。查询lynx的配置文件在/etc/lynx-cur/lynx.cfg  (Debian系统)
打开/etc/lynx-cur/lynx.cfg
查看鸟哥的教程，鸟哥修改如下：
[root@linux ~]# vi /etc/lynx.cfg
CHARACTER_SET:utf-8            <==约在 399 行
#ASSUME_CHARSET:iso-8859-1     <==约在 414 行
#PREFERRED_LANGUAGE:en         <==约在 542 行

# 你可以将它改成如下所示：
CHARACTER_SET:big5
ASSUME_CHARSET:big5
PREFERRED_LANGUAGE:zh_TW

因为大陆的字符集和台湾的字符集不同，我是如下修改。

CHARACTER_SET:gb2312
ASSUME_CHARSET:gb2312
PREFERRED_LANGUAGE:zh_CN
保存退出。

使用lynx登录网站，依然乱码。

然后按照另外一种方法修改

[root@linux ~]# LANG=zh_CN.gb2312
[root@linux ~]# lynx http://www.baidu.com
依然乱码。

具体解决方法：
root@linux~# lynx -display_charset=gb2312 www.baidu.com
正常显示中文。






lynx浏览中文网页显示乱码，Google很久才发现下面这篇文章给出了解决方法：

from  http://blog.quickbest.net/archives/ubuntu/ubuntu-lynx-gb2312.html

第一种方法验证可行，第二种方法为替代方案。

解决方案一
============

解决使用lynx浏览采用GB2312编码的中文网页时出现乱码的问题：

第一步：
$ export LANG=zh_CN.gb2312

第二步：
设置菜单：终端 -> 设置字符编码 -> 简体中文(GB2312)

第三步：
$ lynx -display_charset=gb2312 http://www.htexam.net/

注：在Ubuntu 11.04下测试通过。

解决方案二
============

使用w3m代替lynx：

$ w3m http://www.htexam.net/


refs:  
[命令行下使用浏览器的方法](http://www.bitscn.com/os/linux/200904/158516.html)  