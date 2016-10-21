#!/bin/bash

function usage()
{
    echo "Version: 0.0.1"
    echo "Usage:"
    echo "    1) Copy added and modified files between svn revision REV_FROM and REV_TO to directory DST_DIR:"
    echo "        svn_diff_draw -m REV_FROM REV_TO DST_DIR"
    echo "    2) List file path of deleted files to file DST_FILE:"
    echo "        svn_diff_draw -d REV_FROM REV_TO DST_FILE"
}

if [ $1 == "-h" ]; then
    usage
    exit 0
fi
if [ ! $# -eq 4 ]; then
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

TYPE=$1
SVN_FROM=$2
SVN_TO=$3
DST=$4

if [ $TYPE == "-m" ]; then
    echo "Summarizing for adding and modifing"

    if [ ! -d $DST ]; then
        echo "mkdir -p $DST"
        mkdir -p $DST
    fi

    for i in `svn diff -r$SVN_FROM:$SVN_TO --summarize | grep '^[AM]' | sed 's:^[AM]M*\s*::g' | sed 's: :!@!:g'`; do
        SRC=`echo $i | sed 's:!@!: :g'`;
        DIR=`dirname $SRC`

        if [ ! -d $DST/"$DIR" ]; then
            echo "mkdir -p $DST/$DIR"
            mkdir -p $DST/"$DIR"
        fi

        if [ -f $SRC ]; then 
            echo "cp $SRC $DST/$SRC"
            cp $SRC $DST/"$SRC"
        fi
    done

fi

if [ $TYPE == "-d" ]; then
    svn diff -r$SVN_FROM:$SVN_TO --summarize | grep '^D' | sed 's:^D\s*::g' > $DST
fi

exit 0
