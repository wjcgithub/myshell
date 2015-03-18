#!/bin/bash
#log_spe.sh

mysql="/usr/local/mysql/bin/mysql -h10.1.1.237 -udemo -p123456"

sql="show databases"

# create_sql="create table test.countab(
# 		id int unsigned auto_increment primary key,
# 		date varchar(100),
# 		ip varchar(100),
# 		num int
# 	)"

$mysql -e "$create_sql"

yesterday=`date -d yesterday +%Y%m%d`

srclog="/usr/local/apache2/logs/access_log"

dstlog="/usr/local/apache2/logsbak/access_${yesterday}.log"

mv $srclog $dstlog

#挂起httpd进程(禁止重启)
pkill -1 httpd


#统计,然后入库
cat /usr/local/apache2/logsbak/access_20150317.log | awk '{print $1}' | sort -R | uniq -c 
