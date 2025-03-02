#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-02-25 15:03
# * Filename : print_图形.sh
# **********************************************************
echo '方法1；打印9*9乘法表'
for i in $(seq 9); do
	for j in $(seq $i); do
		echo -n "$j*$i=$((i * j)) "
	done
	echo ""
done

echo -e "\t"
echo '方法2；打印9*9乘法表'
for ((a = 1; a <= 9; a++)); do
	for ((b = 1; b <= $a; b++)); do
		c=$(($a * $b))
		echo -n -e "$a*$b=$c\t"
	done
	echo ""
done

: '
1*1=1	
2*1=2	2*2=4	
3*1=3	3*2=6	3*3=9	
4*1=4	4*2=8	4*3=12	4*4=16	
5*1=5	5*2=10	5*3=15	5*4=20	5*5=25	
6*1=6	6*2=12	6*3=18	6*4=24	6*5=30	6*6=36	
7*1=7	7*2=14	7*3=21	7*4=28	7*5=35	7*6=42	7*7=49	
8*1=8	8*2=16	8*3=24	8*4=32	8*5=40	8*6=48	8*7=56	8*8=64	
9*1=9	9*2=18	9*3=27	9*4=36	9*5=45	9*6=54	9*7=63	9*8=72	9*9=81	
'

echo -e "\t"
echo '打印直线'
for ((a = 1; a <= 60; a++)); do
	echo -n "*"
done
echo ""

: '
************************************************************
'
echo -e "\t"
echo -e "打印矩形"
for ((a = 1; a <= 3; a++)); do
	for ((b = 1; b <= 60; b++)); do
		#echo  "*"
		echo -n "*"
	done
	echo ""
done

: '
************************************************************
************************************************************
************************************************************
'

echo -e "\t"
echo -e "打印靠左的直角三角形"
for ((a = 1; a <= 8; a++)); do  #输出行数,8行
	for ((b = 1; b <= a; b++)); do #输出直线的*，每行随a值增加而增加
		echo -n "*"
	done
	echo ""
done

: '
*
**
***
****
*****
******
*******
********
'

echo -e "\t"
echo -e "打印靠右的直角三角形"
for ((a = 1; a <= 8; a++)); do
	for ((i = 8; i >= a; i--)); do
		echo -n " "
	done
	for ((b = 1; b <= a; b++)); do
		echo -n "*"
	done
	echo ""
done
: '
        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
'

echo -e "\t"
echo -e "打印靠左倒直角三角形"
for ((a = 1; a <= 8; a++)); do
	for ((b = 8; b >= $a; b--)); do
		echo -n "*"
	done
	echo ""
done

: '
********
*******
******
*****
****
***
**
*
'

#通过输出空倒三角和算法($a*2-1)输出奇数个星号
echo -e "\t"
echo -e "打印等腰三角形"
for ((a = 1; a <= 9; a++)); do
	#输出空倒三角
	for ((b = 9; b >= $a; b--)); do
		echo -n " "
	done
	#输出实心三角
	i=$((($a * 2) - 1))
	for ((h = 1; h <= $i; h++)); do
		echo -n "*"
	done
	echo ""
done

: '
         *
        ***
       *****
      *******
     *********
    ***********
   *************
  ***************
 *****************
'

#空格倒三角拼靠右直角三角再拼靠左直角三角
echo -e "\t"
echo -e "打印靠左的直角三角形"
for ((a = 1; a <= 9; a++)); do
	for ((b = 9; b >= a; b--)); do
		echo -n " "
	done
	for ((c = 1; c <= a; c++)); do
		echo -n "*"
	done
	for ((d = 2; d <= a; d++)); do
		echo -n "*"
	done
	echo
done

: '
         *
        ***
       *****
      *******
     *********
    ***********
   *************
  ***************
 *****************
 '

echo -e "\t"
echo -e "打印倒等腰三角形"
for ((a = 1; a <= 6; a++)); do
	for ((b = 1; b <= a; b++)); do
		echo -n " "
	done
	i=$(($a * 2 - 1))
	for ((c = 11; c >= $i; c--)); do
		echo -n "*"
	done
	echo " "
done

: '
 *********** 
  ********* 
   ******* 
    ***** 
     *** 
      * 
'

echo -e "\t"
echo -e "打印平行四边形"
for ((a = 1; a <= 6; a++)); do
	#输出空倒三角
	for ((b = 6; b >= $a; b--)); do
		echo -n " "
	done
	#输出直线
	for ((c = 1; c <= 12; c++)); do
		echo -n "*"
	done
	echo ""
done

: '
      ************
     ************
    ************
   ************
  ************
 ************
'

echo -e "\t"
echo -e "打印反直角梯形"
for ((a = 1; a <= 9; a++)); do
	for ((b = 9; b >= a; b--)); do
		echo -n " "
	done
	for ((c = 1; c <= $(($a + 5)); c++)); do
		echo -n "*"
	done
	echo
done

: '
         ******
        *******
       ********
      *********
     **********
    ***********
   ************
  *************
 **************
'

echo -e "\t"
echo -e "打印正直角梯形"
for ((a = 1; a <= 10; a++)); do
	for ((c = 1; c <= $(($a + 5)); c++)); do
		echo -n "*"
	done
	echo
done

: '
******
*******
********
*********
**********
***********
************
*************
**************
***************
'

echo -e "\t"
echo -e "打印等腰梯形"
for ((a = 5; a <= 10; a++)); do  #定义行数，a=5掐掉头
	for ((b = 10; b >= a; b--)); do #输出空倒三角形
		echo -n " "
	done
	i=$(($a * 2 - 1))
	for ((c = 1; c <= i; c++)); do #输出直线
		echo -n "*"
	done
	echo
done

: '
      *********
     ***********
    *************
   ***************
  *****************
 *******************
'

echo -e "\t"
echo -e "打印菱形"
for ((a = 1; a <= 10; a++)); do  #输出行数
	for ((b = 10; b >= a; b--)); do #输出空倒三角
		echo -n " "
	done
	i=$(($a * 2 - 1))
	for ((c = 1; c <= i; c++)); do #输出正等腰三角
		echo -n "*"
	done
	echo
done

for ((p = 2; p <= 10; p++)); do #输出行数
	for ((q = 1; q <= p; q++)); do #输出空正三角
		echo -n " "
	done
	h=$(($p * 2 - 1))
	for ((w = 19; w >= $h; w--)); do #输出倒等角三角
		echo -n "*"
	done
	echo
done

: '
          *
         ***
        *****
       *******
      *********
     ***********
    *************
   ***************
  *****************
 *******************
  *****************
   ***************
    *************
     ***********
      *********
       *******
        *****
         ***
          *
'

echo -e "\t"
echo -e "打印靠左的直角三角形"
for ((a = 1; a <= 10; a++)); do  #输出行数
	for ((b = 10; b >= a; b--)); do #输出空倒三角
		echo -n " "
	done
	i=$(($a * 2 - 1))
	for ((c = 1; c <= i; c++)); do #输出正等腰三角
		echo -n "*"
	done
	echo
done

: '
		  *
         ***
        *****
       *******
      *********
     ***********
    *************
   ***************
  *****************
 *******************
'

for ((p = 2; p <= 10; p++)); do #输出行数
	for ((q = 1; q <= p; q++)); do #输出空正三角
		echo -n " "
	done
	h=$(($p * 2 - 1))
	for ((w = 19; w >= $h; w--)); do #输出倒等角三角
		echo -n "*"
	done
	echo
done

: '

  *****************
   ***************
    *************
     ***********
      *********
       *******
        *****
         ***
          *
'

echo -e "\t"
echo -e "打印国际象棋棋盘"
# 设置两个变量,i 和 j,一个代表行,一个代表列,国际象棋为 8*8 棋盘
# i=1 是代表准备打印第一行棋盘,第 1 行棋盘有灰色和蓝色间隔输出,总共为 8 列
# i=1,j=1 代表第 1 行的第 1 列;i=2,j=3 代表第 2 行的第 3 列
# 棋盘的规律是 i+j 如果是偶数,就打印蓝色色块,如果是奇数就打印灰色色块
# 使用 echo -ne 打印色块,并且打印完成色块后不自动换行,在同一行继续输出其他色块
for i in {1..8}; do
	for j in {1..8}; do
		sum=$((i + j))
		if [ $((sum % 2)) -eq 0 ]; then
			echo -ne "\033[46m  \033[0m"
		else
			echo -ne "\033[47m  \033[0m"
		fi
	done
	echo
done

