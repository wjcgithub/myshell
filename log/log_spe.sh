#!/bin/bash
#log_spe.sh
yesterday=`date -d yesterday +%Y%m%d`

srclog="/usr/local/apache2/logs/access_log"

dstlog="/usr/local/apache2/logsbak/access_${yesterday}.log"

mv $srclog $dstlog

#挂起httpd进程(禁止重启)
pkill -1 httpd


#统计,然后入库
#cat /usr/local/apache2/logsbak/access_20150317.log | awk '{print $1}' | sort -R | uniq -c
