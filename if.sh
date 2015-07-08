#!/bin/bash
#if.sh
#判断年龄
age=24
if [[ $age -lt 18 ]]; then
	echo "未成年"
else
	echo "已成年"
fi


#年龄等级
#60以下
#60-70
#70-80
#80-90
#90以上
score=67
if [[ $score -lt 60 ]]; then
	echo "60以下"
elif [[ $score -lt 70 ]]; then
	echo "60-70之间"
elif [[ $score -lt 80 ]]; then
	echo "70-80之间"
elif [[ $score -lt 90 ]]; then
	echo "80-90之间"
else
	echo "90以上"
fi


#今天是周几
week=`date +%w`
case $week in
	1 )
	echo "周1"
	;;

	2)
	echo "周2"
	;;

	3 )
	echo "周3"
	;;

	4 )
	echo "周4"
	;;

	5)
	echo "周5"
	;;

	*)
	echo "other"
	;;
esac


#case test
case $1 in
	start )
	echo "start!!!"
	;;

	stop )
	echo "stop!!!"
	;;

	restart )
	echo "restart!!!"
	;;

	* )
	echo "please input start|stop|restart"
esac


#循环控制