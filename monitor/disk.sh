#!/bin/bash
#web.sh

ds=`df|awk '{if(NR==2){print int($4)}}'`

if [ $ds -lt 45 ]
then
	str="disk < 45%"
else
	str="disk > 45%"
fi

echo $str|mail -s 'disk used status' root@lampym.com
