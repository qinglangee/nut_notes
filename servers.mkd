# server 配置记录
*目录*
document  文档, 配置,生成的数据之类的, 生成数据很多的就不放在这了
git_repo  git 下载目录, 一般在这, 
download  下载的内容
bash      一些bash脚本
/srv      一些服务的根目录

## ali
toilet

    cd /home/zhch/git_repo/toilet
    ./run
octpress
*由定时器做的*

    cd /home/zhch/git_repo/blog_markdown  # 源文件目录
    git pull   # git 更新
    ./cp_wordpress  # 转换成 jekyll/octpress 需要的形式, 并copy到 blog_static目录
*需要手工做的*

    cd /home/zhch/git_repo/octopress  # 进入源目录, 这里的 source/_posts是链接到blog_static目录的
    rake generate  # 生成网站内容
    nohup rake preview &  # 启动

*nginx*

    自动重启

## linode

diary

    [zhch@li722-168 ~]$ l
    nginx                /usr/local/nginx/conf/servers
    web                  /srv/webcontent

    sudo service mongod start   # 只有start, 没有stop, stop 用 kill

    g web
    ./run
mongo 
配置文件在 /etc/mongod/mongod.conf


