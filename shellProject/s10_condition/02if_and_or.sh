#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2024-07-30 22:01
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 02if_and_or.sh
#######################################################
echo '(1)------------------完美分割线---------------------'
echo -n "Enther number:"
read num
if [[ ($num -lt 10) && ($num%2 -eq 0) ]]; then
	echo -e "even number\n"
else
	echo -e "odd number\n"
fi

echo '(2)------------------完美分割线---------------------'
echo -n "Enter any number:"
read n
if [[ ($n -eq 15) || ($n -eq 45) ]]; then
	echo "You won"
else
	echo "You lost!"
fi
