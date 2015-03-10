-- 去掉address的前面两个字
update shop_local set address = SUBSTRING(address,3) where address like '中国%' and localId<99999999;

-- 导出表结构和表数据
mysqldump -h192.168.1.15 -uskst -p'TestDBSkst$@'  v506_20121017 dashboard_basic > dump.sql

-- 导出表结构不要数据  加参数 -d 
mysqldump -h192.168.1.15 -uskst -p'TestDBSkst$@' -d v506_20121017 dashboard_basic > dump.sql
