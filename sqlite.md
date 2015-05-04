# sqlite

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