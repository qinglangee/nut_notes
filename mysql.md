   vim: ft=markdown  
#  常用命令

## 连接字符串

	jdbc:mysql://localhost:3306/dbname?useUnicode=true&characterEncoding=UTF-8
	jdbc:mysql://localhost:3306/dbname?useUnicode=true&amp;characterEncoding=UTF-8
## 查看引擎状态

show table status from 数据库名;
desc table_name;
show columns from table_name;
SHOW CREATE TABLE example;

mysql -h110.110.110.110 -uroot -pabcd123

## 查看建表语句

    show create table web_job_skill;


### 查看所有数据库 / 所有表

    show databases;
    use test;
    show tables;

    -- 查看表数据
    use information_schema;
    select concat(round(sum(DATA_LENGTH/1024/1024), 2), 'MB') as data from TABLES;
    -- 查看某一个表
    select concat(round(data_length/1024/1024,2), 'MB') as data from tables where TABLE_SCHEMA='resume_import_sys' and TABLE_NAME='resume_company_info';
### 查看所有用户
用 root 用户登录

    select distinct Grantee  from information_schema.user_privileges;

###  查看version
select version();

### 查看连接情况
echo "show processlist" | mysql -uusername -p'password'  | awk '{print $3}' | awk -F : '{print $1}' | sort | uniq -dc
TestDBSkst$@  
查看当前连接数量
show status like '%Threads_connected%';
查看连接时间大于某一数值的
SELECT id FROM information_schema.processlist WHERE State = 'Locked' AND Time > 10;
查出kill语句
SELECT concat('KILL ', id, ';') FROM information_schema.processlist WHERE State = 'Locked' AND Time > 10;

### 查看最大连接数
show variables like 'max_connections';
要对 mysql 的最大连接数进行修改，只需要在 my.cnf 配置文件里面修改 max_connections 的值，然后重启 mysql 就行。如果 my.ini 文件中没有找到 max_connections 条目，可自行添加以下条目
max_connections = 200

命令设置当前最大连接数
set GLOBAL max_connections=800;

### 查看sleep连接超时时间
show variables like 'wait_timeout';
命令行设置超时时间
set global wait_timeout=100;


## 修改数据库引擎
改为innodb
alter table 表名 type = innodb;

改为myisam
ALTER TABLE `dbname`.`tablename` engine = myisam row_format = dynamic;

如果报错
ERROR 1206 (HY000): The total number of locks exceeds the lock table size
原来是InnoDB表执行大批量数据的更新，插入，删除操作时会出现这个问题，需要调整InnoDB全局的innodb_buffer_pool_size的值来解决这个问题

## 二、增加新用户。

 *创建用户授权时,%和localhost要分别授权两遍??*
1.创建授权分两步
create user 'skst'@'%' identified by 'password';

create user 'skst'@'localhost' identified by 'password';
update user set Host='%' where User='skst';
grant all privileges on *.* to 'skst'@'%';

2.一步完成
格式：grant select on 数据库.* to 用户名@登录主机 identified by "密码";
例1、增加一个用户 test1 密码为 abc123，让他可以在任何主机上登录，并对所有数据库有查询、插入、修改、删除的权限。首先用以 root 用户连入 MySQL，然后键入以下命令：

    grant select, insert, update, delete on *.* to [email=test1@]test1@"%[/email]" Identified by "abc123"; 

grant all on *.* to  user_name@'%' identified by 'password';

但例1增加的用户是十分危险的，如某个人知道test1的密码，那么他就可以在internet上的任何一台电脑上登录你的mysql数据库并对你的数据为所欲为了，解决办法见例2。
例2、增加一个用户test2密码为abc123,让他只可以在localhost上登录，并只可以对数据库 mydb进行查询、插入、修改、删除的操作（localhost指本地主机，即MYSQL数据库所在的那台主机），这样用户即使用知道test2的密码，他也无法从internet上直接访问数据库，只能通MYSQL主机上来访问了。 命令如下:
grant select, insert, update,delete on mydb.* to test2@localhost identified by "abc123"; 

如果你不想test2有密码，可以再打一个命令将密码消掉。 命令如下：
grant select, insert, update, delete on mydb.* to test2@localhost identified by "";

### 查看用户
select user();  -- 查看当前用户
select * from information_schema.user_privileges;

## 三、修改密码。
格式：mysqladmin -u用户名 -p旧密码 password 新密码
例1：给root加个密码ab123。首先在DOS下进入目录mysqlbin，然后键入以下命令
mysqladmin -uroot -password ab12
注：因为开始时root没有密码，所以-p旧密码一项就可以省略了。
例2：再将root的密码改为abc345。
mysqladmin -uroot -pab123 password abc345
　　在这里我们讲了登录、增加用户、密码更改等问题。下篇我们来看看MYSQL中有关数据库方面的操作。注意：你必须首先登录到MYSQL中，以下操作都是在MYSQL的提示符下进行的，而且每个命令以分号结束。

## 创建数据库

     CREATE DATABASE `wordpress` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
## 删除数据库

    drop database `dbname`;
## 数据库修改
修改increment 自动增长基数

    使用sql语句：alter table table_name AUTO_INCREMENT=n
数据库改名 *原来有个改名的语句来着， 后来因为危险干掉了，就不能改名了*

## 表操作

### 执行sql脚本 

执行sql脚本,可以有2种方法:
  第一种方法:
 在命令行下(未连接数据库),输入 (注意路径不用加引号的!!) 回车即可.

    mysql -h localhost -u root -p123456 < F:\hello world\niuzi.sql 
  第二种方法:
 在命令行下(已连接数据库,此时的提示符为 mysql> ),输入 

    source F:\hello world\niuzi.sql 
    (注意路径不用加引号的) 或者 
    \. F:\hello world\niuzi.sql (注意路径不用加引号的) 回车即可
## 表结构修改


建立索引
create [unique][cluster]index <索引名> on table|view(<列名>[<次序>][,<列名>[<次序>]]...)
CREATE INDEX mytable_categoryid ON mytable (category_id);
CREATE UNIQUE INDEX user_collected_item ON eatables_collect (accountId, type, targetId);
唯一索引
CREATE UNIQUE INDEX user_collected_item ON eatables_collect (accountId, type, targetId);
查看索引

    SHOW INDEX FROM table_name [FROM db_name];
删除索引

    DROP INDEX indexname ON tablename;

创建可以级联 删除/更新 的外键

    CONSTRAINT  `comments_ibfk_1`  FOREIGN   KEY  (`blog_id`)  REFERENCES  `blogs` (`id`)  ON   DELETE   CASCADE
    CONSTRAINT  `comments_ibfk_1`  FOREIGN   KEY  (`blog_id`)  REFERENCES  `blogs` (`id`)  ON   UPDATE   CASCADE
查看所有外键

    select       concat(table_name, '.', column_name) as 'foreign key',        
    concat(referenced_table_name, '.', referenced_column_name) as 'references' 
    from      information_schema.key_column_usage  where      table_schema='sqtzhch' and      referenced_table_name is not null;
删除外键

    alter table resume_education drop foreign key `FK_tym9fj9os2ribbikv3vwoxge`;

删除外键


    alter table 表名 drop foreign key  约束名;
    alter table web_job_skill drop foreign key  FK_web_job_skill_web_skill;
添加/删除/修改字段

    ALTER TABLE `web_company_filters_s`
    CHANGE COLUMN `filters` `name`  varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `company_gid`,
    CHANGE COLUMN `name` `filters`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `name`;  -- 修改字段

    ALTER TABLE `web_profile_s`  DROP COLUMN `uid`,
        DROP COLUMN `cell_link_source`,
        DROP COLUMN `resume_pool`;  -- 删除字段

    ALTER TABLE `web_profile_s` ADD COLUMN `group_id` VARCHAR(255) NOT NULL AFTER `source`;  -- 添加字段
    ALTER TABLE zhch CHANGE name name2 varchar(22); -- 修改列名  CHANGE 或 CHANGE COLUMN 都可以

## 表名修改

    -- 跨数据库
    RENAME TABLE db_name.table1 TO new_db_name.table1,
                     db_name.table2 TO new_db_name.table2;
    -- 同数据库
    RENAME TABLE table1 TO table2;
## 问题解决

### root密码记,或root无法登录
这种问题需要强行重新修改密码，方法如下：

/etc/init.d/mysql stop   (service mysqld stop )
/usr/bin/mysqld_safe --skip-grant-tables
另外开个SSH连接

    [root@localhost ~]# mysql
    mysql>use mysql
    mysql>update user set password=password("123456") where user="root";
    mysql>flush privileges;
    mysql>exit

如果表中没有root的记录, 插入一条
 insert into user set user='root',ssl_cipher='',x509_issuer='',x509_subject='';
(这时可能会提示某字段如ssl_cipher无默认值,　只要加上,ssl_cipher=''; 其字段如有提示依次添加就OK了)
 

## 完全备份数据库：

    shell$ mysqldump --tab=/path/to/some/dir --opt db_name

或：

shell$ mysqlhotcopy db_name /path/to/some/dir
只导出结构, 没有数据

    mysqldump -d -h localhost -u root -pmypassword databasename > dumpfile.sql
导出部分表的结构和数据

    mysqldump  -h 192.168.1.48 -u username -p（密码提示后再输入） college_2013 --tables college_info > dumpfile.sql
导出数据

    c:$ mysqldump -udb_username -pdb_password myplick > sqlname.sql
导出表的部分数据 

    mysqldump -u用户名 -p密码 数据库名 表名 --where="筛选条件" > 导出文件路径
    mysqldump -uroot -p123456 dbname tablename --where=" sensorid=11 and fieldid=0" > /home/xyx/Temp.sql
    # max_allowed_packet
    mysqldump -uroot -p123456 --max_allowed_packet=100M  --net_buffer_length=1M dbname tablename > /home/xyx/Temp.sql

 You can also set the following variables by using --var_name=value syntax:

    max_allowed_packet

    The maximum size of the buffer for client/server communication. The default is 24MB, the maximum is 1GB.

    net_buffer_length

    The initial size of the buffer for client/server communication. When creating multiple-row INSERT statements (as with the --extended-insert or --opt option), mysqldump creates rows up to net_buffer_length bytes long. If you increase this variable, ensure that the MySQL server net_buffer_length system variable has a value at least this large. 

导出数据到文件

    mysql -h127.0.0.1 -uroot -p000000 -e"select * from a" test > 1.txt 
    host ip     user   password   query statement  database  filename 
这样会输出列名信息，如果不想输出列名信息： 
 
    mysql -h127.0.0.1 -uroot -p000000 -N -e"select * from a" test > 1.txt 

数据恢复

    c:$ mysql < database.sql -uusername -ppassword -Ddatabase
查询数据写入文件

    select * from user into outfile '/tmp/user.txt';


    select * from user into outfile '/tmp/user.txt' FIELDS TERMINATED BY ','  OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n'； 
### The MySQL Server returned this Error:MySQL Error Nr. MySQL server has gone away。

解决的方法就是找到mysql安装目录，找到my.ini文件，在文件的最后添加： max_allowed_packet = 32M(也可以设置自己需要的大小)。 max_allowed_packet 参数的作用是，用来控制其通信缓冲区的最大长度。

    在[mysqld] 的分段下面是导入, 在[mysqldump]分段下面是导出

    update message_sequence set createtime = date_add(createtime,interval -3 day);

组合结果行　: select GROUP_CONCAT(CONVERT(accountId, CHAR)) from account where l99no in (3082423,3098391,3090830


导入数据的方法:
第一种

    mysql>use test;
    mysql> source c:/test.sql
导入数据时，如果目标数据库或表是UTF-8字符集的，而导入SQL中有中文，可能在最终结果中出现乱码，此时只需在导入的SQL文件第一行加入如下内容 即可。

    /*!40101 SET NAMES utf8 */;
第二种

    mysql < /tmp/sql.sql -uroot -pLifeix -Dsqlvsmem

MySQL导出的SQL语句在导入时有可能会非常非常慢，经历过导入仅45万条记录，竟用了近3个小时。在导出时合理使用几个参数，可以大大加快导入的速度。

    -e 使用包括几个VALUES列表的多行INSERT语法;
    --max_allowed_packet=XXX 客户端/服务器之间通信的缓存区的最大大小;
    --net_buffer_length=XXX  TCP/IP和套接字通信缓冲区大小,创建长度达net_buffer_length的行

注意：max_allowed_packet和net_buffer_length不能比目标数据库的配置数值大，否则可能出错。

首先确定目标库的参数值

    mysql>show variables like 'max_allowed_packet';
    mysql>show variables like 'net_buffer_length';

根据参数值书写mysqldump命令，如：

    mysql>mysqldump -uroot -p 数据库名  -e --max_allowed_packet=1048576 --net_buffer_length=16384 > SQL文件 


# 语法 and 函数 

## 字符串
连接

    update tablename set name=CONCAT('abc',  name, 'def') WHERE age=12;
替换

    update pintimes.wp_posts set post_content=replace(post_content,'imgs.pintimes.com','imgs.lifeixdesign.us') where id = 177887;
## 更新
用表的内容更新自己

    update pintimes.wp_posts set post_content=replace(post_content,'imgs.pintimes.com','imgs.lifeixdesign.us') where id = 177887;
## 查询插入
相当于 Oracle 的 select into 语句
    
    insert into tmp_score_job (company_gid) select c.company_gid from tmp_score_company c;