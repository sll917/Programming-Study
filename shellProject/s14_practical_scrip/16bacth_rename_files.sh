#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2024-07-13 13:10
# Email: sll917@outlook.com
# Version: V1.0
# File Name: rename.sh
#######################################################
# 递归查找文件并重命名文件,只需要放在需要更改的目录下.
# read -p "input your dirname " DIR_NAME
DIR_NAME=$(basename $PWD)
for u in gif mp4 jpeg jpg png ;do
	n=1
	for o in $(find -name "*.$u"); do
		p=$(echo $(basename $o))
		#使用文件目录的专有命令basename和dirname
		q=$(echo $(dirname $o))
		mv $q/$p $q/"${DIR_NAME}"$n${p##*.$u}.$u >/dev/null 2>&1
		let "n++"
	done
done

