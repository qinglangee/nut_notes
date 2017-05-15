# genymotion 常见问题

## 下载
genymotion 个人版是免费的，需要登录帐号后会看到免费下载链接，不登录时不显示了。

## 常见错误

*Unable to start Genymotion virtual device, incompatible CPU*
The first time I ran Genymotion virtual device, it had worked. But when I tried running it today, I got this error message

- Ok, I found out that this happened as VT-x was used by some other application in windows and VirtualBox could not use it.
就是说有可能是另一个应用占用了 VT-x, 有可能是另一个 Android 模拟器，关掉重试一下。
[stackoverflow上这个问题相关](http://stackoverflow.com/questions/21757368/unable-to-start-genymotion-virtual-device-incompatible-cpu)


*INSTALL_FAILED_CPU_ABI_INCOMPATIBLE  某些应用安装不了*
下载 GenyMotion-ARM-Translation_v1.1.zip 拖到 Android 模拟器里安装，安装好重启模拟器。
[使用Genymotion调试出现错误INSTALL_FAILED_CPU_ABI_INCOMPATIBLE解决办法 ](http://blog.csdn.net/wjr2012/article/details/16359113)  
[Installing ARM Translation and GApps](https://forum.xda-developers.com/showthread.php?t=2528952)  