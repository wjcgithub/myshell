#!/bin/bash
#for.sh
for  ((i=0; i<10; i++))
do
	#useradd user$i
	# userdel -r user$i
	# echo 123 | passwd --stdin user$i
	# userdel -r
	if  [ $i -eq 5 ];  then
		# break
		continue
	fi
	echo  $i
done


read -p "please press one key:" key

echo $key

case $key in 
	[a-z]|[A-Z])
	echo "字母键"
	;;

	[0-9])
	echo "数字键"
	;;

	*)
	echo "功能键"
	;;
esac