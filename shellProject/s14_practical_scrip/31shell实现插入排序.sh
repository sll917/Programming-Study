#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-06-26 19:09
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 31shell实现插入排序.sh
#######################################################
echo '(1)------------------完美分割线---------------------'
declare -a array
for i in $(seq 1 10); do
	array[$i]=$RANDOM
done
echo -e "Array_1: ${array[*]}"

for ((x = 1; x <= 9; x++)); do
	for ((y = 1; y <= 9; y++)); do
		if [ "${array[$y]}" -gt "${array[$y + 1]}" ]; then
			temp=${array[$y]}
			array[$y]=${array[$y + 1]}
			array[$y + 1]=$temp
		fi
	done
done
echo -e "Array_2: ${array[*]}"
