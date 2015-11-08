#!/bin/sh
# 功能：将第一个目录(及子目录中)的所有文件移到第二个目录中(第二个参数要设置绝对路径，不传递子目录，并且删除空的子目录)
# 作者：matt
# 版本：1.0
# 创建时间：2015/11/6
# 最后更新：2015/11/6
if [ $# -ne 2 ]; then
    echo "参数错误,如：./moveEduxDR.sh /data/sailong/xDR/log /home/sailong/"
    exit 1
fi
cd $1
OLD_IFS="$IFS"
floders=$(ls)
TFS=" "
floderList=($floders)

for floder in ${floderList[@]}
do
    TFS="$OLD_IFS"
    if [ "`ls -A $floder`" = "" ]
    then
        rm -rf $floder
        #echo "$floder"
    else
        mv $floder/* $2
    fi
    OLD_IFS="$IFS"
    TFS=" "
done
