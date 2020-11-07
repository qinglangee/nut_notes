  vim: ft=markdown

# idea 操作

## 常用操作
rename

    shift+F6
生成 serialVersionUID

    Setting->Inspections->Serialization issues->Serializable class without ’serialVersionUID’ 
    选上以后，在你的class中：Alt+Enter就会提示自动创建serialVersionUID了
显示行号

     File | Settings. Within the "IDE Settings" section of that dialog, you'll find it under Editor | Appearance.
设置自已的字典

    A custom dictionary is a mere textual file with a .dic extension, with each word starting on a new line.
    All you have to do is to point to the directories where your dictionaries are stored, in the Spelling of the Settings dialog.

## 快捷键设置 
File->Settings->Keymap  
行操作， 搜索 duplicate line  , move line  , delete line 设置 Ctrl+上/下  Alt+上/下  Ctrl+d

搜索 Previous/Next Method 去掉 alt-上/下
搜索 duplicate line  去掉 ctrl-d
搜索 scroll up/down  去掉 ctrl-上/下

MainMenu->Code->Completion->Basic  Alt-j  

crtl-b 函数定义与调用处跳转  
ctrl-alt-左/右方向  光标位置后退/前进  

## 内存不够用
Application -> Android Studio 显示包内容，然后Contents -> bin -> studio.vmoptions这个文件
-Xms和-Xmx后面的值都改大一些，默认750M完全不够用的

## 界面字体修改
`File -> Settings -> Appearance`, 将字体改为 `WenQuanYi Micro Hei`  

## 添加Path变量
File->Settings->Appearance & Behavior ->Path Variables