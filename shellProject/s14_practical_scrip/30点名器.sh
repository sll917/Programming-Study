#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-11-12 12:29
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 30点名器.sh
#######################################################
echo '(1)------------------完美分割线---------------------'
# 编写一个点名器脚本

# 该脚本,需要提前准备一个 user.txt 文件
# 该文件中需要包含所有姓名的信息,一行一个姓名,脚本每次随机显示一个姓名
while :
do
	#统计 user 文件中有多少用户
	line=`cat user.info |wc -l`
	num=$[RANDOM%line+1]
	sed -n "${num}p"  user.info
	sleep 3
	clear
done

