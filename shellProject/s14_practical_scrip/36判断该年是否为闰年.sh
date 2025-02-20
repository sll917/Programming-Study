#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-06-17 12:58
# File Name: 52判断该年是否为闰年.sh
# Email: sll917@outlook.com
# Version: V1.0
#######################################################
# 提示用户输入年份后判断该年是否为闰年
# 能被4整除并且并不能被100整除的年份是闰年
# 能被400整除的年份也是闰年

read -p "请输入一个年份:" year
if [ "$year" = "" ]; then
	echo "没有输入年份"
	exit
fi

#使用正则测试变量 year 中是否包含大小写字母
if [[ "$year" =~ [a-zA-Z] ]]; then
	echo "你输入的不是数字"
	exit
fi

# 判断是否为闰年
if [ $((year % 4)) -eq 0 ] && [ $((year % 100)) -ne 0 ]; then
	echo "$year年是闰年"
elif [ $((year % 400)) -eq 0 ]; then
	echo "$year年是闰年"
else
	echo "$year年不是闰年"
fi
