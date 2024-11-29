#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2024-06-23 13:25
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 50彩色输出_helloworld.sh
#######################################################
echo '(1)------------------完美分割线---------------------'
# 字体颜色
for i in {31..37}; do
	echo -e "\033[$i;40mHello world!\033[0m"
done
# 背景颜色
for i in {41..47}; do
	echo -e "\033[47;${i}mHello world!\033[0m"
done
# 显示方式
for i in {1..8}; do
	echo -e "\033[$i;31;40mHello world!\033[0m"
done

