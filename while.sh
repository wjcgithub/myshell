#!/bin/bash
#while.sh
# i=0
# total=0
# while [ $i -lt 10 ]
# do
# 	echo $i
# 	total=$(($i+$total))
# 	i=$(($i+1))
# 	#useradd user$i
# 	userdel user$i
# 	#echo '123'|passwd --stdin user$i
# 	sleep 1
# done
# echo "total is:"+$total

#一次创建十个用户
i=0
while [ $i -lt 10 ]
do
	if [[ $i%2 -eq 0 ]]; then
		echo -e "\033[30;41m$i\033[0m"
	else
		echo $i;
	fi
	i=$(($i+1))
	# sleep 1
done

#for 循环
for i in user1 user2 user3 user4 user5; do
	//echo $i
	echo "123" | passwd   --stdin $i
done

#将所有的用户名存起来
cat /etc/passwd | awk -F: '{print $1}' > ./users.log

cat /etc/passwd|awk -F: '{if($NF~/bash/) {print}}'
