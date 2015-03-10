    vim: ft=markdown
# 命令
## 常用命令

_导出_

    svn checkout  --username zhangcheng --password zh@ng svn://svnServerName/XLib ./localpath
    example:
    svn checkout  --username zhangcheng --password zh@ng svn://svn.xy.l99.com:9001/lifeix_jars/lifeix-apps/trunk ./dir
_更新_

    svn update
_添加_

    svn add foo
_查看状态_

    svn status
    svn status --show-updates  # 查看版本库中有没有更新
_查看历史_

    svn log
    svn log filename

    svn cat
    svn list
_比较内容_

    svn diff rules.txt
    svn diff -r 3 rules.txt     # 与特定版本比较
    svn diff -r 2:3 rules.txt   # 版本之间比较
_恢复修改_

    svn revert filename
预定将文件、目录或者符号链foo添加到版本库，当你下次提交后，foo会成为其父目录的一个子对象。注意，如果foo是目录，所有foo中的内容也会预定添加进去，如果你只想添加foo本身，请使用--non-recursive (-N)参数。

_导出内容_

    svn export http://svn.example.com/svn/repos1 -r 1729
## 冲突解决
_手工解决_

    $ svn resolved sandwich.txt
    $ svn commit -m "Go ahead and use my sandwich, discarding Sally's edits."
_直接使用某一个版本_

    $ cp sandwich.txt.r2 sandwich.txt
    $ svn resolved sandwich.txt
## 设置ignore

    svn propedit svn:ignore project1

# 服务器命令

## 新建一个仓库
`svnadmin create /path/to/repo`  # 创建仓库在/path/to/repo, 此目录中有conf等子目录


[使用Subversion进行版本控制][1]  


[1]: http://www.subversion.org.cn/svnbook/1.4/index.html
