############################### Hardware information Tool
#####################
#Version: 1.0 
#Auther:kll 
#Mail:k_liang@126.com 
########################################################### 
#/bin/sh
echo -ne "\t注意："
echo -e " 请以root权限来执行该脚本。"
echo -e "\t (Please use root to execute this shell)" 
echo -ne "\t
请输入您当前的机器名称，不能包含空格符号。例如：Piaget1.0-PV-SKU3(Dis) " :
read dirname
if [ -e $dirname ] ; then
  rm $dirname -rf
fi
cd . 
mkdir $dirname
cat /etc/sysconfig/hwconf >$dirname/hwconf.txt
cat /proc/cpuinfo >$dirname/cpuinfo.txt
dmidecode -t memory >$dirname/meminfo.txt
dmidecode -s bios-version >$dirname/bios.txt
dmidecode -s bios-release-date >$dirname/biosd.txt
lspci >$dirname/lspci.txt
lspci -n >$dirname/lspcin.txt
cd $dirname
touch hardinfo.html
echo >hardinfo.html
echo "<META http-equiv=Content-Type content='text/html; charset=utf-8>'"
>>hardinfo.html
echo "<html>" >>hardinfo.html
echo "<body>" >>hardinfo.html
echo "<pre>" >>hardinfo.html

echo "<table align="center" border="1" cellpadding="5" cellspacing="0"
width="900">" >>hardinfo.html

echo "<tr>" >> hardinfo.html
echo "<center>">> hardinfo.html
echo "<b>">>hardinfo.html
echo "机 型:$dirname">>hardinfo.html
echo "<b>">>hardinfo.html

echo "</tr>" >> hardinfo.html


echo "<tr>" >> hardinfo.html
echo "<td align="center">" >>hardinfo.html
echo "<b>">>hardinfo.html
echo "硬件类别">>hardinfo.html
echo "<b>">>hardinfo.html
echo "</td>" >>hardinfo.html
echo "<td align="center">" >>hardinfo.html
echo "<b>">>hardinfo.html
echo "硬件信息">>hardinfo.html
echo "<b>">>hardinfo.html
echo "</td>" >>hardinfo.html
echo "<td align="center">" >>hardinfo.html
echo "<b>">>hardinfo.html
echo "ID">>hardinfo.html
echo "<b>">>hardinfo.html
echo "</td>" >>hardinfo.html
echo "</tr>" >>hardinfo.html

###############CPU information###########
echo "<tr>" >> hardinfo.html
echo "<td align="center">" >>hardinfo.html
echo "CPU信息">>hardinfo.html
echo "</td>" >>hardinfo.html
echo "<td>" >>hardinfo.html
echo `cat /proc/cpuinfo |grep -w 'model name'|awk -F: '{print
$2}'|uniq`>>hardinfo.html
echo "</td>" >>hardinfo.html
echo "</tr>" >> hardinfo.html

############### Memory information###########

echo "<tr>" >> hardinfo.html
echo "<td align="center">" >>hardinfo.html
echo "内存">>hardinfo.html
echo "</td>" >>hardinfo.html
echo "<td>" >>hardinfo.html
echo `dmidecode -t memory |grep -5 "Memory Device"|grep -i "MB"|grep -i
"size"|awk '{print $2,$3}'` >>hardinfo.html
echo "</td>" >>hardinfo.html
echo "</tr>" >> hardinfo.html

############### Host Bridge information###########

echo "<tr>" >> hardinfo.html
echo "<td align="center">" >>hardinfo.html
echo "北桥">>hardinfo.html
echo "</td>" >>hardinfo.html
echo "<td>" >>hardinfo.html
echo `lspci |grep "00:00.0"|awk -F: '{print $3}'`>>hardinfo.html
echo "</td>" >>hardinfo.html
echo "<td>" >>hardinfo.html
echo `lspci -n|grep \`lspci |grep "00:00.0"|awk '{print $1}'\`|awk '{print
$3}'`>>hardinfo.html
echo "</td>" >>hardinfo.html
echo "</tr>" >> hardinfo.html

############### South Bridge information###########

echo "<tr>" >> hardinfo.html
echo "<td align="center">" >>hardinfo.html
echo "南桥">>hardinfo.html
echo "</td>" >>hardinfo.html
echo "<td>" >>hardinfo.html
echo " ">>hardinfo.html
echo "</td>" >>hardinfo.html
echo "<td>" >>hardinfo.html
echo "">>hardinfo.html
echo "</td>" >>hardinfo.html
echo "</tr>" >> hardinfo.html

############### Audio Card information###########

echo "<tr>" >> hardinfo.html
echo "<td align="center">" >>hardinfo.html
echo "声卡">>hardinfo.html
echo "</td>" >>hardinfo.html
lspci |grep "Audio" >> /dev/null
#lspci -n|grep "0403">>/dev/null

if [ $? == 0 ]
then
  echo "<td>" >>hardinfo.html
  echo `lspci |grep "Audio"|awk -F: '{print $3}'`>>hardinfo.html
  # echo `lspci |grep \`lspci -n |awk 'match($2,"0403"){print $1,$3}'|awk
  # '{print $1}'\`|awk -F: '{print $3}'`>>hardinfo.html
  echo "</td>" >>hardinfo.html
  echo "<td>" >>hardinfo.html
  echo `lspci -n|grep "\`lspci |grep "Audio"|awk '{print $1}'\`"|awk '{print
  $3}'`>>hardinfo.html
  # echo `lspci -n |awk 'match($2,"0403"){print $1,$3}'|awk '{print
  # $2}'`>>hardinfo.html
  echo "</td>" >>hardinfo.html
else
  echo "<td>" >>hardinfo.html
  echo "There is no Audio card">>hardinfo.html 
  echo "</td>" >>hardinfo.html
fi
echo "</tr>" >> hardinfo.html

############### NIC Card information###########

echo "<tr>" >> hardinfo.html
echo "<td align="center">" >>hardinfo.html
echo "网卡">>hardinfo.html
echo "</td>" >>hardinfo.html
lspci |grep "Ethernet" >> /dev/null
if [ $? == 0 ]
then
  echo "<td>" >>hardinfo.html
  echo `lspci |grep "Ethernet"|awk -F: '{print $3}'`>>hardinfo.html
  echo "</td>" >>hardinfo.html
  echo "<td>" >>hardinfo.html
  echo `lspci -n|grep \`lspci |grep "Ethernet"|awk '{print $1}'\`|awk '{print
$3}'`>>hardinfo.html
echo "</td>" >>hardinfo.html
echo "</tr>" >> hardinfo.html
else
  echo "<td>" >>hardinfo.html
  echo "There is no NIC card">>hardinfo.html 
  echo "</td>" >>hardinfo.html
fi
echo "</tr>" >> hardinfo.html
############### HDD information###########

echo "<tr>" >> hardinfo.html
echo "<td align="center">" >>hardinfo.html
echo "硬盘">>hardinfo.html
echo "</td>" >>hardinfo.html
echo "<td>" >>hardinfo.html
echo -n `hdparm -I /dev/sda |grep "Model Number"|awk -F: '{printf
$2}'`>>hardinfo.html
echo `hdparm -I /dev/sda |grep "size"|grep GB|awk '{print
$9,$10}'`>>hardinfo.html
echo "</td>" >>hardinfo.html
echo "</tr>" >> hardinfo.html

############### Wireless card information##############

echo "<tr>" >> hardinfo.html
echo "<td align="center">" >>hardinfo.html
echo "无线网卡">>hardinfo.html
echo "</td>" >>hardinfo.html
lspci |grep "Network" >> /dev/null
if [ $? == 0 ]
then
  echo "<td>" >>hardinfo.html
  echo `lspci |grep "Network"|awk -F: '{print $3}'` >> hardinfo.html
  echo "</td>" >>hardinfo.html
  
  echo "</td>" >>hardinfo.html
  echo "<td>" >>hardinfo.html
  echo `lspci -n|grep \`lspci |grep "Network"|awk '{print $1}'\`|awk '{print
  $3}'`>>hardinfo.html
  echo "</td>" >>hardinfo.html
else
  echo "<td>" >>hardinfo.html
  echo "There is no wireless card">>hardinfo.html 
  echo "</td>" >>hardinfo.html
fi
echo "</tr>" >> hardinfo.html

##########################################################

echo -e "\t 恭喜你！已经成功的建立了硬件信息目录`pwd`,请查看相关的硬件信息"
echo -e "\t (Conguration!The hardware information has been send to the dir
`pwd`,please get details from this dir) "
echo -e "\t 请稍候..."
sleep 5
firefox `pwd`/hardinfo.html &
