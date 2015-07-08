#!/bin/bash
echo "aaaaaaaaaaa"
echo 
echo "bbbbbbbbbbbb"
echo 
echo "ccccccccccccccc"


echo -e "\033[36;41m[ok]\033[0m"

echo "aaaaaaaaaaaaaaaaaaa"
if [ -d /etc/a ]; then
		echo "this is a dir"
	else
		echo "this i not a dir"
fi


#判断是否有人登陆当前系统
if [ `who| wc -l` -gt 1 ]; then
		echo "当前的登陆用户有多人"
	else
		echo "当前就一人"
fi


#测试boot空间
bootspace=`df -Th | grep 'boot' | awk '{print $6}' | cut -d '%' -f1`
if [ $bootspace -ge 14 ]; then
	echo "boot space greater than 14%"
else
	echo "boot space less than 14%"
fi	

read -p "please input your name:" name
read -p "please input your pass:" pass

if [ $name -eq 'admin' ] && [ $pass -eq "123" ]
then
	echo "login success!"
else
	echo "login fail!"
fi
