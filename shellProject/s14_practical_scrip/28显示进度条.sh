#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-11-12 12:23
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 28显示进度条.sh
#######################################################
echo '(1)------------------完美分割线---------------------'
# 显示进度条(回旋镖版)
while :
do
  clear
  for i in {1..20}
  do
    echo -e "\033[3;${i}H*"
    sleep 0.1
    done
    clear
    for i in {20..1}
    do
    echo -e "\033[3;${i}H*"
    sleep 0.1
    done
    clear
done

echo '(2)------------------完美分割线---------------------'
# 显示进度条(数字版)
# echo 使用-e 选项后,在打印参数中可以指定 H,设置需要打印内容的 x,y 轴的定位坐标
# 设置需要打印内容在第几行,第几列
for i in {1..100}
do
    echo -e "\033[20;8H["
    echo -e "\033[20;9H$i%"
    echo -e "\033[20;13H]"
    sleep 0.1
done

echo '(3)------------------完美分割线---------------------'
# 进度条,动态时针版本
# 定义一个显示进度的函数,屏幕快速显示|  / ‐ \
rotate_line() {
	INTERVAL=0.5 #设置间隔时间
	COUNT="0"    #设置4个形状的编号,默认编号为 0(不代表任何图像)
	while :; do
		COUNT=$(expr $COUNT + 1) #执行循环,COUNT 每次循环加 1,(分别代表4种不同的形状)
		case $COUNT in           #判断 COUNT 的值,值不一样显示的形状就不一样
		"1")                     #值为 1 显示‐
			echo -e '‐'"\b\c"
			sleep $INTERVAL
			;;
		"2") #值为 2 显示\\,第一个\是转义
			echo -e '\\'"\b\c"
			sleep $INTERVAL
			;;
		"3") #值为 3 显示|
			echo -e "|\b\c"
			sleep $INTERVAL
			;;
		"4") #值为 4 显示/
			echo -e "/\b\c"
			sleep $INTERVAL
			;;
		*) #值为其他时,将 COUNT 重置为 0
			COUNT="0" ;;
		esac
	done
}
rotate_line
