#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-11-09 11:37
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 08三个数字排序.sh
#######################################################
echo '(1)------------------完美分割线---------------------'
# 依次提示用户输入 3 个整数,脚本根据数字大小依次排序输出 3 个数字
read -p " 请输入一个整数：" num1
read -p " 请输入一个整数：" num2
read -p " 请输入一个整数: " num3

# 不管谁大谁小,最后都打印 echo "$num1,$num2,$num3"
# num1 中永远存最小的值,num2 中永远存中间值,num3 永远存最大值
# 如果输入的不是这样的顺序,则改变数的存储顺序,如:可以将 num1 和 num2 的值对调
tmp=0
# 如果 num1 大于 num2,就把 num1 和和 num2 的值对调,确保 num1 变量中存的是最小值
if [ $num1 -gt $num2 ]; then
	tmp=$num1
	num1=$num2
	num2=$tmp
fi
# 如果 num1 大于 num3,就把 num1 和 num3 对调,确保 num1 变量中存的是最小值
if [ $num1 -gt $num3 ]; then
	tmp=$num1
	num1=$num3
	num3=$tmp
fi
# 如果 num2 大于 num3,就把 num2 和 num3 对调,确保 num2 变量中存的是最小值
if [ $num2 -gt $num3 ]; then
	tmp=$num2
	num2=$num3
	num3=$tmp
fi
echo "排序后数据（从小到大）为：$num1,$num2,$num3"

echo '(2)------------------完美分割线---------------------'
# 对 100 以内的所有正整数相加求和(1+2+3+4...+100)
#seq 100 可以快速自动生成 100 个整数
sum=0
for i in `seq 100`
do
    sum=$[sum+i]
done
echo "总和是:$sum"

