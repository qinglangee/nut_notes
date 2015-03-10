   vim: ft=markdown  
# 连接

    ./mongo 192.168.1.21:27017/dbname

    mongo 192.168.1.21:27017/dovebox

    $ help()
    $ db.help()
    $ db.table_name.help()
[连接字符串][1]  

    mongodb://[username:password@]host1[:port1][,host2[:port2],...[,hostN[:portN]]][/[database][?options]]
    mongodb://zhch:zhch@127.0.0.1:27017
    mongodb://db1.example.net,db2.example.net:2500/?replicaSet=test&connectTimeoutMS=300000

# 工具
## gui

gui  Robomongo http://robomongo.org/ 
## 备份

    // 导出数据
    mongodump -h 192.168.1.123 --port 12345 -d dbname -o /tmp/mongo_data
    // 恢复/导入数据
    mongorestore -h dbhost -d dbname --directoryperdb /tmp/mongo_data/dbname

# 增删改查

## 查询个数
db.analyze_job_done.count()
## 正则查询

    db.users.findOne({"username" : /.*son.*/});
    db.comment.find({content:{$regex:"^[^{]"}});  // 查询content内容不是以{开头的

## 查询排序
db.users.find().sort({username:1});
## 插入
db.users.insert({"name":"aa", "age":12});
## 删除记录
删除集合中所有文档, 不删除集合

    db.users.remove()
删除集合中userId = 1 的文档

    db.users.remove({userId:1})

## 多条翻页, 下一页
it


## 包含查询
I have blogpost collection, and blogpost has a tags filed which is an array, e.g.

    blogpost1.tags = ['tag1', 'tag2', 'tag3', 'tag4', 'tag5']
    blogpost2.tags = ['tag2', 'tag3']
    blogpost3.tags = ['tag2', 'tag3', 'tag4', 'tag5']
    blogpost4.tags = ['tag1', 'tag4', 'tag5']

How can I do these searchs

    contains 'tag1'
    contains ['tag1','tag2'],
    contains any of ['tag3', 'tag4']
Try this:

    db.blogpost.find({ 'tag' : 'tag1'}); //1
    db.blogpost.find({ 'tag' : { $all : [ 'tag1', 'tag2' ] }}); //2
    db.blogpost.find({ 'tag' : { $in : [ 'tag3', 'tag4' ] }}); //3

## 更新

    // 查询, 更新
    db.content_basic.find({_id:{$gt:35558015},aid:{$in:[961205,961206]}}).forEach(
        function(x){
            x.load = "[" + x.load + "]";
            db.content_basic.update({_id:x._id}, x);
        }
    )

更新

    db.analyze_job_done.update({a:b},{$set:{time:new Date(2012,11,12)}})   // 这个只会更新符合条件的第一条

    db.analyze_job_done.update({a:b},{$set:{time:new Date(2012,11,12)}}, false, true)   // 这个会更新所有符合条件的  update(query, obj, upsert, multi)
    db.analyze_job_done.update({a:b},{$set:{time:new Date(2012,11,12)}},{ multi: true })   // 这个也会更新所有符合条件的


# 函数
1. $ db
test
2. $ db.dropDatabase()
3. $ db.foo.drop()
4. 赋值 
$ var temp = db.ttt.findOne({type:1234});


# 索引
扫描记录数据很多的时候就要考虑index用的是不是正确的, 如果不是正确的,考虑强制指定所用索引.

    $ db.eatables_local_name.ensureIndex({"localName" :1});
    $ db.eatables_local_name.ensureIndex({"localName" :1, "localId":1});
    $ db.eatables_local_name.ensureIndex({"localName" :1, "localId":1}, {"name":"indexName"});
    $ db.eatables_local_name.ensureIndex({"localName" :1}, {"unique":true});
    $ db.eatables_local_name.ensureIndex({"localName" :1}, {"unique":true, dropDups:true});
    $ db.eatables_local_name.dropIndex({"localName" :1});
    $ db.eatables_local_name.dropIndex({"indexname"});
    $ db.eatables_local_name.getIndexes();
子文档索引

    db.Mail.ensureIndex({'attachments.filename':1})
稀疏索引,只对这个字段不为空的记录做索引

    db.Mail.ensureIndex({labels:1},{sparse:true})
强制索引

    db.Mail.find({user:'zhaoxy1@szdep.com',folderId:'inbox'}).hint('index1')
    db.Mail.find({user:'zhaoxy1@szdep.com',folderId:'inbox'}).hint({ age: 1 })
如果你查找的值正好是在索引中，则可以直接返回索引中存的值，而不用到数据文件中查找。（这个在传统关系型数据库中也有实现），不过，必须满足以下条件： 
1. 必须提供准备的返回字段，以便可以直接从索引库中查询 
2. 必须明确地排除使用 *_id*字段 `{_id：0}`

当用explain时，当indexOnly=true，表示有用到covered index

    db.users.find({username: "joe"}, {_id: 0, roles: 1}).explain()
Mongodb能为前缀型的正则表达式命中索引，比如：需要查询Mail中user以z开头的： /^z/ 
如果有user索引，这种查询很高效. 开头是模糊匹配的则不行, 用不到索引 .


# 命令

1. 导入js语句

        ./mongo 127.0.0.1:3003/test   test.js
1. 删除数据库

        use dbname;
        db.dropDatabase();

开启关闭profile

    db.setProfilingLevel(0)
    db.setProfilingLevel(1)
    db.setProfilingLevel(2)
重新设置profile表大小, 4000000 bytes

    db.setProfilingLevel(0)
    db.system.profile.drop()
    db.createCollection( "system.profile", { capped: true, size:4000000 } )
    db.setProfilingLevel(1)
日志切换 

    use admin
    db.runCommand( { logRotate : 1 } )
查看 working set 大小 

    db.runCommand( { serverStatus: 1, workingSet: 1 } )
查看连接数

    db.serverStatus().connections
    ulimit -a | grep stack   #系统每个进程占用内存查看
至于MongoDB实际使用的Stack大小，可以用如下命令确认（单位：K）：

    cat /proc/$(pidof mongod)/limits | grep stack | awk -F 'size' '{print int($NF)/1024}'
查看 mongodb 版本号

    mongod  --version   
    //  另一种, 连接上服务器后
    db.serverStatus()     // 在结果的开头有版本号
# 服务器
## 启动服务器
一般指定 --dbpath就可以了

    /usr/local/mongodb-linux-x86_64-2.4.10/bin/mongod --dbpath /data/mongo_2.4.10/data
也可以指定一些其它的东西, 比如在配置文件中设置一些配置, 在启动时指定配置文件

    /usr/bin/mongod -f /etc/mongod.conf 
/etc/mongod.conf的内容如下

    #where to log
    logpath=/var/log/mongo/mongod.log

    logappend=true
    oplogSize=4096
    # fork and run in background
    fork = true

    #port = 27017
    # 设置需要访问控制
    # auth=true

    dbpath=/data/mongodb

    # location of pidfile
    pidfilepath = /var/run/mongodb/mongod.pid
        
## 配置
权限验证, 见wordpress  
配置文件中设置 

    auth=true
用户名密码登录

    mongo  -u zhch -p  --authenticationDatabase admin    # 交互式输入密码
    mongo  -u zhch -p zhch --authenticationDatabase admin  


##  查看所有的用户信息

    use admin
    db.system.users.find();





refs: 
[Connection String URI Format][1]  


[1]: http://docs.mongodb.org/manual/reference/connection-string/
