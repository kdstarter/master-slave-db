# MySQL主从同步详解与配置 https://zhuanlan.zhihu.com/p/335142300
# setp1: on master server, create sync user
mysql -h 127.0.0.1 -P 3306 -u root -p'123'
CREATE DATABASE `master_db` CHARACTER SET 'utf8';
CREATE user 'rep'@'%' IDENTIFIED BY '1234567';
GRANT replication slave,replication client on *.* TO 'rep'@'%';
mysql -h 127.0.0.1 -P 3306 -u rep -p'1234567'

# step2: backup and restore initial db
mysqldump -h 127.0.0.1 -P 3306 -u root -p'123' master_db --single-transaction --master-data=1 --flush-logs > tmp/mysql_init.sql #`date +%F_%H-%M-%S`-mysql-all.sql
mysql -h 127.0.0.1 -P 3307 -u root -p'456' < tmp/mysql_init.sql

# setp3: on slave server, set master db
change master to master_host='db1',master_user='rep',master_password='1234567',master_log_file='a37dc98c1c66-bin.000006',master_log_pos=154;
start slave;
SHOW slave status\G;
