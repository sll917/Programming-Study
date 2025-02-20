#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-07-05 16:01
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 67获取随机字符串或数字.sh
#######################################################
echo '(1)------------------完美分割线---------------------'
# 获取随机8位字符串：
# 方法1：
echo $RANDOM |md5sum |cut -c 1-8

echo '(2)------------------完美分割线---------------------'
openssl rand -base64 4

echo '(3)------------------完美分割线---------------------'
cat /proc/sys/kernel/random/uuid |cut -c 1-8

echo '(4)------------------完美分割线---------------------'
echo $RANDOM |cksum |cut -c 1-8

echo '(5)------------------完美分割线---------------------'
openssl rand -base64 4 |cksum |cut -c 1-8

echo '(6)------------------完美分割线---------------------'
date +%N |cut -c 1-8

echo '(7)------------------完美分割线---------------------'
# 生成10个随机数保存于数组中并找出其最大值和最小值
declare -i min max
declare -a nums
for ((i = 0; i < 10; i++)); do
	nums[$i]=$RANDOM
	[ $i -eq 0 ] && min=${nums[0]} && max=${nums[0]} && continue
	[ ${nums[$i]} -gt $max ] && max=${nums[$i]}
	[ ${nums[$i]} -lt $min ] && min=${nums[$i]}
done
echo "All numbers are ${nums[*]}"
echo Max is $max
echo Min is $min
