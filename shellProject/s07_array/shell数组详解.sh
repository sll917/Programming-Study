#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2024-02-28 09:27
# Email: sll917@outlook.com
# Version: V1.0
# File Name: shell数组详解.sh
#######################################################
: '
Shell 在编程方面比 Windows 批处理强大很多，无论是在循环、运算。
bash 支持一维数组（不支持多维数组），并且没有限定数组的大小。类似与 C 语言，数组元素的下标由0开始编号。获取数组中的元素要利用下标，下标可以是整数或算术表达式，其值应大于或等于0。

定义数组
在 Shell 中，用括号来表示数组，数组元素用“空格”符号分割开。定义数组的一般形式为：
array_name=(value1 ... valuen)
例如：
array_name=(value0 value1 value2 value3)
或者
array_name=(
value0
value1
value2
value3
)
还可以单独定义数组的各个分量：
array_name[0]=value0
array_name[1]=value1
array_name[2]=value2
可以不使用连续的下标，而且下标的范围没有限制。
'

echo '(1)------------------完美分割线---------------------'
: '
读取数组
读取数组元素值的一般格式是：
${array_name[index]}
例如：
valuen=${array_name[2]}
'
#举个例子：
NAME[0]="Zara"
NAME[1]="Qadir"
NAME[2]="Mahnaz"
NAME[3]="Ayan"
NAME[4]="Daisy"
echo "First Index: ${NAME[0]}"
echo "Second Index: ${NAME[1]}"

echo '(2)------------------完美分割线---------------------'
#使用@或*可以获取数组中的所有元素，例如：
: '
${array_name[*]}
${array_name[@]}
'
#举个例子：
NAME[0]="Zara"
NAME[1]="Qadir"
NAME[2]="Mahnaz"
NAME[3]="Ayan"
NAME[4]="Daisy"
echo "First Method: ${NAME[*]}"
echo '-----------------------------------------------------------'
echo "Second Method: ${NAME[@]}"
#运行脚本，输出：
#First Method: Zara Qadir Mahnaz Ayan Daisy
#Second Method: Zara Qadir Mahnaz Ayan Daisy

echo '(3)------------------完美分割线---------------------'
#获取数组的长度
#获取数组长度的方法与获取字符串长度的方法相同，例如：
## 取得数组元素的个数
array_name=(`seq 9`)
echo -e "length=${#array_name[@]}"
echo '-----------------------------------------------------------'
echo -e "length=${#array_name[*]}"
# 取得数组单个元素的长度
echo -e "length=${#array_name[0]}"
echo -e "length=${#array_name[1]}"

echo '-----------------------------------------------------------'
declare -A array_1
array_1=([sll]=liangliangsu [lrn]=liruonan [jack]=jackma)
echo -e "length=${#array_1[@]}"
echo '-----------------------------------------------------------'
echo -e "length=${#array_1[*]}"
# 取得数组单个元素的长度
echo -e "length=${#array_1[sll]}"
echo -e "length=${#array_1[lrn]}"

echo '(4)------------------完美分割线---------------------'
#建立数组
arrSource=("arrJobs.php"  "arrSubHangye.php" "arrFirst.php" )

arrDest=("buildhr"            \
         "buildtrain/htdocs"  \
         "bankhr"             \
         "healthr"            \
         "elehr"              \
         )

#取数组无元素个数
lenArrSource=${#arrSource[*]}
lenArrDest=${#arrDest[*]}


#循环列出数组元素
i=0
while  [ $i -lt $lenArrSource ]
do
   echo ${arrSource[$i]}
   let i++
done

echo '-----------------------------------------------------------'
i=0
while  [ $i -lt $lenArrDest ]
do
   echo ${arrDest[$i]}
   let i++
done
