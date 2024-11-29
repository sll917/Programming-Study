#!/bin/bash
#功能描述(Description):打印各种色块形状.
#练习循环嵌套

# for i in $(seq 6)
# do
#     for j in $(seq $i)
#     do
#         echo -ne "\033[101m  \033[0m"
#     done
#     echo
# done

for ((i=1;i<=6;i++))
do
	for ((j=1;j<=i;j++))
    do
        echo -ne "\033[101m  \033[0m"
    done
    echo
done
