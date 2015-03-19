#!/bin/bash
#web.sh

df=`free -m|awk '{if(NR==2){print int($3*100/$2)}}'`
echo $df
if [ $s -lt 50 ]
then
	str="disk < 50%"
else
	str="disk > 50%"
fi

echo $str|mail -s 'memory used status' root@lampym.com
