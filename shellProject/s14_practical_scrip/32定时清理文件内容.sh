#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-07-06 10:20
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 67定时清理文件内容.sh
#######################################################
echo '(1)------------------完美分割线---------------------'
# 每小时执行一次脚本（任务计划），当时间为0点或12点时，将目标目录下的所有文件内容清空，
# 但不删除文件，其他时间则只统计各个文件的大小，一个文件一行，输出到以时间和日期命名的文件中，需要考虑目标目录下二级、三级等子目录的文件

logfile=/tmp/log_$(date +%H-%F).log
n=$(date +%H)
if [ $n -eq 00 ] || [ $n -eq 12 ]; then
	#通过for循环，以find命令作为遍历条件，将目标目录下的所有文件进行遍历并做相应操作
	for i in $(find /var/log/ -type f); do
		true >$i
	done
else
	for i in $(find /var/log/ -type f); do
		du -sh $i >> $logfile
	done
fi

