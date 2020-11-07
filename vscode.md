# visual studio code 文档
## welcome tips
快速打开 `C+o  C+Tab`
命令面板 `C+S+p`

## 快捷键修改
File->Preferences->Keyoard Shortcuts
它会打开默认绑定和用户设定， 照着修改就行了， 下面是一些设定， （把 ctrl+d  ctrl+up ctrl+down 它们原来的功能与现在的交换了）
新版本的要点击 open keyboard shortcuts 按钮才会打开文件， 不打开就是手动改。

	// Place your key bindings in this file to overwrite the defaults
	[

	{ "key": "ctrl+d",          "command": "editor.action.deleteLines",
	                                     "when": "editorTextFocus" },
	{ "key": "ctrl+shift+k",                "command": "editor.action.addSelectionToNextFindMatch",
	                                     "when": "editorFocus" },
	{ "key": "ctrl+down",        "command": "editor.action.copyLinesDownAction",
	                                     "when": "editorTextFocus && !editorReadonly" },
	{ "key": "ctrl+up",          "command": "editor.action.copyLinesUpAction",
	                                     "when": "editorTextFocus && !editorReadonly" },
	{ "key": "shift+alt+up",             "command": "scrollLineDown",
	                                     "when": "editorTextFocus && !editorReadonly" },
	{ "key": "shift+alt+down",               "command": "scrollLineUp",
	                                     "when": "editorTextFocus && !editorReadonly" },
	{ "key": "shift+enter",            "command": "editor.action.insertLineAfter",
	                                     "when": "editorTextFocus && !editorReadonly" },
	{ "key": "ctrl+j",            "command": "editor.action.joinLines",
	                                     "when": "editorTextFocus" },
	{ "key": "alt+h",           "command": "workbench.action.previousEditor" },
	{ "key": "alt+l",         "command": "workbench.action.nextEditor" }
	]


## 设置选项
settings.json 不知道在哪里编辑了， File->Preferences->settings, 搜索对应选项，然后改吧
// 设置自动检测文件编码
"files.autoGuessEncoding":true


## 好用的插件
local history  本地文件历史
vscode-icons   漂亮的图标  


Markdown all inone    编写markdown的好工具
partial diff          文件比较工具
TODO Tree             todo 标签查找定位工具  
better comments       漂亮的注释  
bracket Pair colorizer   漂亮的括号  
better align             漂亮的对齐代码，冒号放中间对齐什么的  
change-case              修改变量命名格式  

visual studio intellicode   代码提示插件   
git blame   git 功能的方便入口  
Prettier    代码格式化  
javascript(es6) code snippets  
sass  样式表  
drawio   画流程图  

## 项目单独的配置文件
在项目文件夹根目录创建 `.editorconfig` 文件。    
它只是针对项目的，全局的用编辑器自己的配置。  
格式参考规范  https://editorconfig.org/  
https://github.com/editorconfig/editorconfig-vscode  

`[*]` 指定文件类型， 可以为 `[*.ts]   [*.js]  [{*.json,*.md,*.yml}]` 等

配置换行符  crlf 换行符为 \r\n , lf 换行符为 \n  
```
# 是否是顶级配置文件，设置为true的时候才会停止搜索.editorconfig文件
root=true

[*]
# 设置换行符内容
end_of_line=lf
# 是否在最后加一个空白行
insert_final_newline=true
```

一、常用属性配置 

1、root<boolean>  :  是否是顶级配置文件，设置为true的时候才会停止搜索.editorconfig文件
2、charset<"latin" | "utf-8" | "utf-8-bom" | "utf-16be" | "utf-16le">     :    文件编码格式
3、indent_style<"tab" | "space">    ：  缩进方式
4、indent_size<number>    ：    缩进大小
5、end_of_line<"lf" | "cr" | "crlf">    ：    换行符类型
6、insert_final_newline<boolean>   ：     是否让文件以空行结束
7、trim_trailing_whitespace<boolean>  ：   是否删除行尾空格 
8、max_line_length<number>    ：    最大行宽。

二、常用文件名匹配

1、*                  匹配除/之外的任意字符
2、**                 匹配任意字符串
3、?                 匹配任意单个字符
4、[name]                 匹配name字符 
5、[!name]                 不匹配name字符
6、[s1,s2,s3]                 匹配给定的字符串
7、[num1..num2]                 匹配num1到mun2直接的整数


目前VSCode并不是所有属性都支持，所以只需要配置下面几个属性即可：

    indent_style
    indent_size
    tab_width
    end_of_line （保存时）
    insert_final_newline （保存时）
    trim_trailing_whitespace （保存时）


# 配置 java 项目
手工建的项目，添加个 `.classpath` 文件，就会出现 `Java Projects` 的配置标签页，会自动识别 lib 目录里的包。  如果没有，看看打开时会报错， 删掉报错的临时目录。  



