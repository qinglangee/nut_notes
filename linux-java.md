  vim: ft=markdown
# ubuntu java 安装

## jdk 1.7
上oracle网站下载 tar.gz包, 解压到一个目录, 其它的跟jdk 1.6一样, 见下面.

## jdk 1.6 
首先，从http://java.sun.com中下载jdk,我的版本是jdk1.6.0_12，我下载的是bin文件，我将下载的jdk1.6.0_12.bin文件置于/usr/lib/jvm/java中
然后，在shell中执行：

    sudo chmod u+x /usr/lib/jvm/java/jdk1.6.0_12.bin

修改bin文件权限，使其可执行
然后，执行

    sudo /usr/lib/jvm/java/jdk1.6.0_12.bin

将会出现字幕，持续按回车键，直至屏幕显示要求输入yes/no，此时输入y回车，将会把jdk解压到文件夹，得到jdk1.6.0_12目录。
此时，jdk已安装完毕，下面进行配置

    sudo vi /etc/environment

在environment中修改，出现如下部分
>PATH＝"......:/usr/lib/jvm/java/jdk1.6.0_12/bin"
>CLASSPATH=.:/usr/lib/jvm/java/jdk1.6.0_12/lib
>JAVA_HOME=/usr/lib/jvm/java/jdk1.6.0_12

执行

    sudo source /home/ghoul/.bashrc

此时，环境变量设置成功（设置环境变量的方法很多，不一一列举）
由于ubuntu中可能会有默认的jdk，如openjdk，所以，为了使默认使用的是我们安装的jdk，还要进行如下工作。
执行

    update-alternatives --install /usr/bin/java  java  /usr/lib/jvm/java/jdk1.6.0_12/bin/java  300
    update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java/jdk1.6.0_12/bin/javac 300

通过这一步将我们安装的jdk加入java选单。
然后执行

    update-alternatives --config java

通过这一步选择系统默认的jdk
这样，再在shell中输入

    java -version


时，就会显示系统使用的java是sun的java。
