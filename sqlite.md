# sqlite

## 命令行工具
sqlite3　或　sqlite3.exe

不用选数据库，直接输入sql语句查询或操作
`select * from table;`

不带参数时生成一个临时数据库，退出命令行数据库消失．　带参数时可以跟sqlite2的数据库文件，如果文件不存在则以文件名新建一个数据库．
常用命令：（其它命令参见[命令行工具手册][1]）
`.help`  显示帮助
`.database` 显示数据库文件名
`.tables`  显示所有表名
## 界面管理工具
SQLiteStudio 下载地址：https://sqlitestudio.pl/index.rvt?act=download

## 索引

新建唯一索引: 

	CREATE UNIQUE INDEX mycolumn_index ON mytable (myclumn);
创建带索引的表

	 CREATE TABLE page (
	     id      INTEGER PRIMARY KEY,
	     name    TEXT UNIQUE,
	     title   TEXT,
	     content TEXT,
	     author  INTEGER NOT NULL REFERENCES user (id),
	     ts      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	 );
     
     
     
refs: 

[Command Line Shell For SQLite ][1]  

[1]: http://sqlite.org/cli.html