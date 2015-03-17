#!/bin/bash
#createtmp.sh
# 1. 取到所有httpd应用程序的进程号
# 2. 把进程号存入一个临时文件中
# 3. 从临时文件中取出所有的apache的进程号
# 4. 使用for循环用kill杀掉所有的httpd进程
# 5. 删除之前生成临时文件
# 6. 输出关闭进程后的消息

tmpfile=$$.txt

ps -e | grep httpd | awk '{print $1}' >> $tmpfile

for pid in `cat $tmpfile`
do
	echo "apache ${pid} is killed!!" 
	kill -9 $pid
done

# rm -rf $tmpfile
echo "apache已经被成功关闭!"
sleep 1