#!/bin/bash

function usage()
{
    echo "Version: 0.0.1"
    echo "Usage:"
    echo "    1) 拷贝指定的用户USERNANE在版本REV_FROM到REV_TO之间所修改和添加的文件到指定目录DST_DIR"
    echo "        svn_log -m REV_FROM REV_TO DST_DIR USERNAME"
}

function cutstr()
{
    strToCheck=$1
    strToSearch=$2
    if [ ! $# -eq 2 ]; then
        echo "args need 2"
        exit ;
    fi
    let pos=`echo $strToCheck | awk -F "$strToSearch" '{printf "%d", length($0)-length($NF)}'`
    #pos=`expr $pos - ${#strToSearch}`
    newStr=`echo ${strToCheck:$pos}`
    return 1
}

if [ $1 == "-h" ]; then
    usage
    exit 0
fi

if [ ! $# -eq 5 ]; then
    usage
    exit 1
else
    if [ ! $1 == "-m" ]; then
        if [ ! $1 == "-d" ]; then
            usage
            exit 1
        fi
    fi
fi

if [ ! -d ".svn" ]; then
    echo "请到项目根目录下面执行（包含.svn文件夹的目录,并且SVN版本要大于1.7）"
fi

TYPE=$1
SVN_FROM=$2
SVN_TO=$3
DST=$4
UNAME=$5

if [ $TYPE == "-m" ]; then
    echo "Summarizing for adding and modifing"

    if [ ! -d $DST ]; then
        echo "mkdir -p $DST"
        mkdir -p $DST
    fi
    
    pwddir=`pwd | awk -F/ '{print $NF}'`
    pwddir=/${pwddir}/

    for i in `svn log -v -r$SVN_FROM:$SVN_TO | sed -n "/$UNAME/,/^-/p"|sed -n '/M/,1p;/A/,1p' | awk '{print $2}'|sort|uniq`; do
        SRC=$i;
        cutstr $SRC $pwddir
        SRC=$newStr
        DIR=`dirname $SRC`
        if [ ! -d $DST/"$DIR" ]; then
            #echo "mkdir -p $DST/$DIR"
            mkdir -p $DST/"$DIR"
        fi

        if [ -f $SRC ]; then 
            #echo "cp $SRC $DST/$SRC"
            cp $SRC $DST/"$SRC"
        fi
    done

    tree $DST
fi

exit 0
