#!/bin/bash
#web.sh

nc -w 3 localhost 80 &>/dev/null

if [ $? -eq 0 ]
then
	str="apache 运行正常！"
else
	str="apache 目前处于关闭，挂起状态"
fi

echo $str|mail -s 'apache web server status' root@lampym.com
