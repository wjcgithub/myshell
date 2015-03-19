#!/bin/bash
#monitor.sh

#----------------------------apache-------------------------------------
nc -w 3 localhost 80 &>/dev/null

if [ $? -eq 0 ]
then
	str="apache 运行正常！"
else
	str="apache 目前处于关闭，挂起状态"
fi

echo $str|mail -s 'apache web server status' root@lampym.com

#----------------------------mysql-------------------------------------
nc -w 3 localhost 3306 &>/dev/null

if [ $? -eq 0 ]
then
	str="mysql 运行正常！"
else
	str="mysql 目前处于关闭，挂起状态"
fi

echo $str|mail -s 'mysql server status' root@lampym.com

#----------------------------disk-------------------------------------
ds=`df|awk '{if(NR==2){print int($4)}}'`

if [ $ds -lt 45 ]
then
	str="disk < 45%"
else
	str="disk > 45%"
fi

echo $str|mail -s 'disk used status' root@lampym.com

#----------------------------momory-------------------------------------
df=`free -m|awk '{if(NR==2){print int($3*100/$2)}}'`
echo $df
if [ $s -lt 50 ]
then
	str="disk < 50%"
else
	str="disk > 50%"
fi

echo $str|mail -s 'memory used status' root@lampym.com

