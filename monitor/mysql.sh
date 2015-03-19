#!/bin/bash
#web.sh

nc -w 3 localhost 3306 &>/dev/null

if [ $? -eq 0 ]
then
	str="mysql 运行正常！"
else
	str="mysql 目前处于关闭，挂起状态"
fi

echo $str|mail -s 'mysql server status' root@lampym.com
