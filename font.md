  vim: ft=markdown
# ubuntu字体安装
## 新版本ubuntu安装字体

从windows下cp .ttf字体文件, 放到 /usr/share/fonts/truetype 目录下就行了
没什么特殊要求的话, cp  simsun.ttc(宋体)就够了

## 配置文件
Fontconfig

    /etc/fonts/fonts.conf
更新缓存

    $ fc-cache 
fontconfig提供了4个命令行工具来管理字体配置：

    fc-list：列出fontconfig知道的所有和模式匹配的字体。
    fc-cache：创建一个所有FreeType于指定目录（或者配置文件中指定的所有目录）中可读字体的缓存。
    fc-cat：从缓存文件或者相关字体目录中读取字体信息，并且以ASCII格式输出。
    fc-match：匹配字体模式（默认为空模式）使用正常的fontconfig匹配规则来寻找最合适的字体。



## 以前的方法

在Ubuntu软件中心搜索font，选择安装“字体管理器"，就可以预览、比较和管理字体了。
     Ubuntu
11.04下安装字体很简单，进入Windows下目录：/media/<你的c盘盘符>/WINDOWS/Fonts，比如我的时/media/System/WINDOWS/Fonts，选中自己想要安装的字体，双击，在右下角点击“安装字体”即可。这样安装的字体为用户字体，会放在隐藏文件夹/home/chenjian/.fonts下。

http://www.huomo.cn/os/article-19d86.html

refs:  
[[Ubuntu]明明白白安装中文字体][1]  
[[原创]一个详细的汉化美化方案(freetype/fontconfig/xft)][2]  
[Fontconfig wiki][3]  
[Fontconfig 中文手册][4]  
[Fontconfig配置详解 by EricCheng ][5]  
	

[1]: http://hi.baidu.com/fortugle/blog/item/d243a964accc5df0f6365455.html
[2]: http://www.linuxsir.org/bbs/thread81056.html
[3]: http://zh.wikipedia.org/zh-cn/Fontconfig
[4]: https://wiki.archlinux.org/index.php/Font_Configuration_%28%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87%29
[5]: http://yangsong.bokee.com/437169.html
