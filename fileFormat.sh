#!/bin/bash
#by zyx
function walk()
{
	for file in `ls $1`
	do
		local path=$1
		local itemname=$1"/"$file 
		if [ -d $itemname ]
		then
			walk $itemname $2
		else
			if [ "${itemname##*.}"x = "c"x ]
			then
				`clang-format -style=$2 -i $itemname`
				echo "$itemname"
			fi

			if [ "${itemname##*.}"x = "h"x ]
			then
				`clang-format -style=$2 -i $itemname`
				echo "$itemname"
			fi
		fi
	done
}

if [ $# -ne 2 ]
then
	echo "USAGE: $0 TOP_DIR  STYLE(LLVM|Google|Chromium|Mozilla|Webkit) "
else
	walk $1 $2
fi

