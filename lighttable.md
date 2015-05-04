# light table

## 修改快捷键
Settings: User keymap command.  打开用户设定
Settings: Default keymap   查看默认设定
*直接在keymap文件中输入就能查询*

添加的格式 [:TAG "KEYBINDING" :COMMAND]
e.g. [:editor "alt-w" :editor.watch.watch-selection].
有参数的
e.g. [:editor "alt-(" (:paredit.select.parent "(")].
去掉默认的， 在前面加'-'
e.g. [:app "-ctrl-shift-d" :docs.search.show]


一些改过的设定


     [:app "ctrl-p" :show-commandbar-transient]
     [:app "alt-m" :toggle-console]

     [:editor.keys.hinting.active "-enter" [:passthrough]]
     [:editor "ctrl-d" :editor.delete-line]
     [:editor "alt-up" :editor.sublime.swapLineUp]
     [:editor "alt-down" :editor.sublime.swapLineDown]
     [:editor "ctrl-down" :editor.sublime.duplicateLine]
     [:editor "ctrl-up" :editor.sublime.selectLinesUpward]

## 快捷键
界面文件管理

    Ctrl-Space or going to View -> Commands  打开命令查询
    Cmd-Shift-O  打开文件
    View -> Workspace   打开目录树
    Ctrl-o    Workspace搜索文件
命令执行

    Ctrl-Enter    执行一行代码
    Ctrl-Shift-Enter  执行整个文件

## 设置行为
Settings: User behaviors


    [:editor :lt.objs.editor/tab-settings false 4 4]

## 一些命令

Browser: add browser tab   添加一个浏览器tab
Tabset: Add a tabset       分割窗口
