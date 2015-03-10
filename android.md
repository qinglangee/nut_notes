  vim: ft=markdown
# commands
命令行安装, 卸载, 重装 apk

    adb install ebook.apk
    adb uninstall net.blogjava.mobile.ebook  // 卸载要用包名
    adb install -r ebook.apk


# tips
##  style 
在styles文件中定义的style, 如果有重名的style, 后定义的会覆盖前面定义的
## animation
Android 3.0以下或使用support v4 fragment: 要使用旧的animation api, 在anim/目录下,用R.anim.xxxx来引用 .
3.0以上的, 用新的animation api, 在animator/目录下, 用R.animator.xxxx引用 .
## R.styleable 是什么东西
TODO
## draw9patch  使用
左边各上边定义拉伸的区域, 右边和下边定义内容区域

# CLASSES

## GridView
*listSelector*
TODO


