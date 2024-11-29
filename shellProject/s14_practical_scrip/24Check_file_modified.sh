#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-11-18 13:59
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 24Check_file_modified.sh
#######################################################
#批量检查文件是否被修改的shell脚本
# 声明变量
checksum_dir="/home/sll/share"

# 创建文件校验存储目录
if [ ! -d $checksum_dir ]; then
	mkdir $checksum_dir
fi

IFS=$'\n'
# 定义函数，获取文件md5值
get_old_md5() {
	K=$(find ${checksum_dir}/old_file/TestFile -type f)
	if [ -f $k ]; then
		md5sum $K | awk '{print $1}' > md5_old.log
	else
		echo "not_found_file"
	fi
}

get_old_md5

IFS=$'\n'
# 定义函数，获取文件md5值
get_new_md5() {
	K=$(find ${checksum_dir}/new_file/TestFile -type f)
	if [ -f $k ]; then
		md5sum $K | awk '{print $1}' > md5_new.log
	else
		echo "not_found_file"
	fi
}
get_new_md5

# 定义函数，检查文件md5值是否改变
diff_file() {
	if [ -f md5_new.log ]; then
		rm md5_new.log
		sleep 2
		get_new_md5
		diff md5_old.log md5_new.log
	else
		get_new_log
		diff md5_old.log md5_new.log
	fi
}

diff_file
if [ $? -eq 0 ]; then
	echo -e "\e[1;32m文件内容未被修改:${checksum_dir}/new_file\e[0m"
	exit 0
else
	echo -e "\e[1;31m文件内容被修改！！！:${checksum_dir}/new_file\e[0m"
	exit 1
fi

