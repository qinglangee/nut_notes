  vim: ft=markdown
# 资料
[Pro git](http://git-scm.com/book/en/v2)  

国内的git仓库  gitcd.com   

    $ mkdir ~/Hello-World
    $ cd ~/Hello-World
    $ git init
    $ touch README


    $ git add README
    $ git commit -m 'first commit'


    $ git remote add origin git@github.com:username/Hello-World.git
    $ git push origin master
    $ git push -u origin master


# git常用命令
指定.git目录位置 , [文档][3]

    git --git-dir=dirname status
>可以把．git作为一个普通ascii文件，　文件内容是  gitdir: <path>, i.e. the path to the real git repository).
 冒号后面一定要有空格

查看所有配置 `git  config  -l(--list)`
全局配置保存位置 `vim ~/.gitconfig`
特定项目的配置文件，git　根目录下的 `.git/config` 文件
删除配置项

    git config --unset --global user.name
    git config --unset --global user.email
    git config --unset --global push.default
重新设置分支同步

    # 设置本地 master 与 origin/<branch> 同步
    git branch --set-upstream-to=origin/<branch> master
添加删除远程仓库

    git remote add [-t <branch>] [-m <master>] [-f] [--[no-]tags] [--mirror=<fetch|push>] <name> <url>
    git remote rename <old> <new>
    git remote remove <name>
常用配置

    git config --global user.name "zhch"
    git config --global user.email "zhch@163.com"
    git config --global push.default simple

    git config --global color.ui "auto"

    # windows 中别名用空格不用等号(好像是新版的都不用等号了)

    git config --global alias.s status
    git config --global alias.c commit
    git config --global alias.a add
    git config --global alias.ck checkout
    git config --global alias.b branch
    git config --global alias.log1 "log --pretty=oneline"
    git config --global alias.d diff
    git config --global alias.ss "status -s"
    git config --global alias.l log


    # 原来linux下别名中间用等号的，现在也不用了
    git config --global alias.s=status
    git config --global alias.c=commit
    git config --global alias.a=add
    git config --global alias.ck=checkout
    git config --global alias.b=branch
    git config --global alias.log1="log --pretty=oneline"
    git config --global alias.d=diff
    git config --global alias.ss="status -s"
    git config --global alias.l=log

也可以直接编辑 .gitconfig 文件中直接添加， windows 下 在 `C:\Users\[user]` 中

    [user]
        email = zhchqingdao@163.com
        name = zhangcheng
    [alias]
        ck = checkout
        s = status
        c = commit
        a = add
        b = branch
        log1 = log --pretty=oneline
        d = diff
        ss = status -s
        l = log
        ignored = !git ls-files -v | grep "^[[:lower:]]"
    [color]
        ui = auto

忽略文件

    .gitignore

忽略文件示例
```
.project
.classpath
.settings/
.myeclipse/
.mymetadata
.externalToolBuilders
WebRoot/WEB-INF/classes
WebRoot/WEB-INF/lib
src/main/web/WEB-INF/classes
src/main/web/WEB-INF/lib
src/main/webapp/WEB-INF/classes
src/main/webapp/WEB-INF/lib
target
bin

```
假装文件没有修改

    git update-index --assume-unchanged filename
    git update-index --no-assume-unchanged config.xml  #恢复假装的文件

    git ls-files -v　　＃忘了哪个假装了，可以这样查看，　假装的前面是小写h

## branch 分支相关的
新建/删除分支

    git branch aa  # 新建分支 aa
    git branch -d aa  ## 删除分支 aa
    git branch -D aa  # 强制删除分支 aa, 没有merge也删除
查看远程分支

    git branch -a
删除远程分支abc

    git push origin :abc
    git push origin --delete abc
从某一版本建立分支 `git branch branchname HEAD^`

把一分支aa push 到仓库,作为仓库的aa分支　`git push origin aa` 或　`git push origin aa:aa`, 一般都用下面这种同时设置为源，要不下次push还要写全路径

把一分支aa push 到仓库, 同时设置为源　 `git push --set-upstream origin aa`

## 后悔相关的 ck revert reset

把一个文件换回最新commit

    git checkout filename
    git checkout -- filename    # 如果刚好有个分支与文件同名, 用这个命令

回退一次提交  (revert 只回退指定提交的修改, 如果有三次需要回退要回退三次, 不能直接回退前面第三次)

    git revert 78dyh6e

强制丢掉所有未提交修改 `git reset --hard`
## git 交互式操作

    git add -i
git 合并提交

    git add .
    git commit --amend  -am "修改订阅按钮样式"    # 这次提交会和上次提交合并成一次提交

## diff 相关的 (diff show)
显示版本号的修改内容　`git show ad1585dbd85`

比较文件不同

    # 前面是旧版本,后面是新版本
    git diff f58c2b52a4b..ad1585dbd85
    git diff master..develop filename
    git diff master..develop -- filename
只查看修改了哪些文件

    git diff --name-only feadf08ff..279a3f6d3
    git diff --name-status feadf08ff..279a3f6d3
查看某版本与自己上一个版本号的差别

    git diff feadf08ff^..feadf08ff      # 上一个版本号
    git diff feadf08ff^^..feadf08ff      # 上两个版本号

## ignore 相关的
gitignore分层
* .gitignore           放项目公用,大家都用的
* .git/info/exclude    放本地, 只自己一个copy用的
* $HOME/.config/git/ignore  放所有项目里都忽略的，全局忽略
    比如，在这个文件中添加一行　`zhignore/`, 那么各级目录中的　zhignore 目录都会被忽略

## tag  相关的
创建一个tag

    git tag -m "message"     # 默认使用参数 -a, 参看 --help
checkout tag

    git checkout tagname
tag 与 branch同名,需要指明是tag, 默认是branch

    git checkout tags/tagname
向服务器推送tag

    git push --tags
显示所有tags

    $ git tag
    `$ git tag -l 'v1.4.2.*'`   #  如果你只对 1.4.2 系列的版本感兴趣
## log 相关的 查看文件历史
git log 有许多选项可以帮助你搜寻感兴趣的提交，接下来我们介绍些最常用的。

用 -2 则仅显示最近的两次更新 `git log -2`

只查看一个文件的历史 `git log filename` 单行显示　`git log --pretty=oneline filename`

查看历史并显示修改的内容 `git log -p filename`

查看两个版本号之间的log `git log f58c2b52a4b..ad1585dbd85`

查看版本号之前的log `git log f58c2b52a4b`

查看版本号之后的log `git log f58c2b52a4b..`

查看每一行的最后提交

    # 显示文件每一行的最后提交
    git blame filename
## 其它不常用的
只全并一个commit的内容

    git cherry-pick  kdfu89jkl
git 导出，不打包 *git 没有export命令， 所以它的导出就是打包，然后解开包就行了*

    git archive master | tar -x -C /somewhere/else   # 这个是直接导出到别的目录
git 打包

    git archive master | bzip2 >source-tree.tar.bz2
    ZIP archive:
    git archive --format zip --output /full/path/to/zipfile.zip master

    today=`date +'%G-%m-%d'`
    git archive --format zip --output /home/lifeix/Nutstore/l99/$today-pintimes.zip develop

*git help archive for more details, it's quite flexible.*

# git 场景处理

## 文件冲突不能pull
有些文件修改了,但只想留在本地用,不想提交到中心仓库,但如果这时别人也修改了这个文件并push到了中心仓库,pull的时候就会报错,提示不能更新.

    $ git stash  # 将当前所有修改暂存,恢复到上一次提交时的状态
    $ git pull   # 现在可以更新合并中心仓库内容
    $ git stash pop  # 取出暂存内容,合并

# git flow常用命令

    git flow feature start 分支名

    git flow feature finish 分支名
    // # 执行这个命令后，会将这个分支上的改动合并回develop，然后删除这个分支，切回develop分支。

    git flow feature publish 分支名

# svn 仓库转为 git仓库
安装git-svn  
创建作者文件,格式如下

    guaniu = Leeiio <xxx@xxx.com>
克隆svn仓库

    $ git svn clone <SVN版本库地址> --no-metadata -A authors.txt -t tags -b branches -T trunk <转换的目的目录名>
    $ git svn clone svn://svn.xy.l99.com:9001/lifeix_jars/DataAnalyzerServer --authors-file=passwd --no-metadata --stdlayout --trunk=./  DataAnalyzerServer

[其他转换branch tag等,看链接][1]  
[svn2git 的转换方法][2]

# git 调试

git 调试

    $ GIT_TRACE=true
    $ export GIT_TRACE
    $ git push origin master
# git 入门
git入门

版本 1.7.4 preview



1. 下载,安装好(或解压好). cmd目录加入 path路径中

2. 设置一下自己的用户名和电子邮件

    $ git config --global user.name "zhch"
    $ git config --global user.email zhchqingdao@163.com

3. 导入一个新工程

    假设现在有一个工程, 根目录是project

    $cd project

    $git init

    这就初始化了一个版本库, 产生一个.git的目录

    $git add .

    add后面的点儿, 表示将当前目录加入到index中, index 就是git的一个临时存储区域, git 管它叫 index

    $git commit

    提交,这是提交了第一个版本

    $git commit -a   参数a可以自动add所有修改过的文件,不需要add那一步,但是-a只处理修改的,不处理新添加的文件.

    $git commit -m 参数m后面跟 commit message信息 , 一起提交. 参数后面的信息有空格时要加引号!

4. 比较改变

    $git diff --cached       比较已经add到index中的文件的改变

    $git diff                      比较没有add到index中的改变

    $git status                  显示所有的改变的一个摘要

 5. 查看历史

    $git log

6. 分支管理

    $git branch                             查看现有分支

    $git branch  abcd                   创建一个叫abcd的分支

    $git checkout abcd                切换到abcd分支

    $git merge abcd                     如果现在是在master分支中,就是把abcd分支的内容合并到master分支中

      如果当前分支中有修改没提交,并且有冲突,不能进行merge操作,会失败

        merge后如果出现冲突(conflict) , 那么冲突文件解决/处理之前不能切换分支, 冲突文件也不能部分提交,必须所有的冲突解决后一起提交

        分支中有文件修改后没提交也不能切换分支, 会警告

    $git branch -d abcd                删除分支abcd, abcd必须已经完全合并到它的上游分支中

    $git branch -D abcd                删除分支abcd, 不管它是否合并

 7. 多人合作  两个人bob  alice

    bob$git clone /home/alice/project myrepo        bob从/home/alice/project获取一份project版本库的克隆, 并命名为myrepo

        如果目录myrepo已存在,并且不是空的,则会提示克隆失败

    alice$git pull /home/bob/myrepo master  alice从/home/bob/myrepo把bob的master分支合并到自己的分支

    pull操作跟merge操作很类似,合并的地方不一样就是了. 查看上面6的merge特性

    alice$git fetch /home/bob/myrepo master

    alice$git log -p HEAD..FETCH_HEAD

    alice$gitk HEAD..FETCH_HEAD          两个点表示查看bob从HEAD开始做了什么改变

    alice$gitk HEAD...FETCH_HEAD         三个点表示查看所有人(还是自己,搞不太清)从HEAD开始做了什么改变



    alice$git remote add bob /home/bob/myrepo      添加一个远程别名

    alice$git remote add bob username@hostname:/home/bob/myrepo      添加一个远程别名

    alice$git fetch bob                            获取/home/bob/myrepo 的当前分支

    alice$git log -p master..bob/master

    alice$git merge bob/master

    alice$git pull . remotes/bob/master            git pull 命令总是合并到当前分支上,不管命令行上给出的是什么

    bob$ git pull                                  bob是从alice克隆出来的,pull时不写地址就是从clone的地方pull

    bob$ git config --get remote.origin.url

    bob$ git config -l              显示所有的参数

    bob$ git clone alice.org:/home/alice/project myrepo    从远程主机克隆

8. 历史管理

    查看英文版去  http://www.kernel.org/pub/software/scm/git/docs/gittutorial.html

git-push     http://www.kernel.org/pub/software/scm/git/docs/git-push.html


gittutorial-2(7) Manual Page

这一节介绍 the object database and the index file

git 对象数据库










# git 帮助
 查看帮助    查看 log 命令的帮助

    $git help log



参考:

下载页面  http://git-scm.com/download

windows版本下载  http://code.google.com/p/msysgit/downloads/list?can=3

Git 中文教程
gittutorial(7) Manual Page

git-merge(1)

git和github - 杂家杂谈 - 博客大巴

git私服搭建  http://fallenlord.blogbus.com/logs/71173948.html   http://fallenlord.blogbus.com/logs/71511589.html   http://fallenlord.blogbus.com/logs/75343490.html  

小组级git服务器搭建  http://blog.prosight.me/index.php/2009/11/485


[1]: http://www.cnblogs.com/analyzer/articles/1736729.html
[2]: https://github.com/nirvdrum/svn2git
[3]: https://www.kernel.org/pub/software/scm/git/docs/gitrepository-layout.html
