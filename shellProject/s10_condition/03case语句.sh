#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-11-12 11:51
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 03case语句.sh
#######################################################
echo '(1)------------------完美分割线---------------------'
: '
case ... esac 与其他语言中的 switch ... case 语句类似，是一种多分枝选择结构。
case 语句匹配一个值或一个模式，如果匹配成功，执行相匹配的命令。case 语句格式如下：
case 值 in
模式1)
command1
command2
command3
;;
模式2）
command1
command2
command3
;;
*)
command1
command2
command3
;;
esac
'
# case 工作方式如上所示。
# 1.取值后面必须为关键字 in
# 2.每一模式必须以右括号结束。取值可以为变量或常数
# 3.匹配发现取值符合某一模式后，其间所有命令开始执行直至 ;;
# 4.;; 与其他语言中的 break 类似，意思是跳到整个 case 语句的最后
# 取值将检测匹配的每一个模式。一旦模式匹配，则执行完匹配模式相应命令后不再继续其他模式
# 如果无一匹配模式，使用星号 * 捕获该值，再执行后面的命令。
# 下面的脚本提示输入1到4，与每一种模式进行匹配：

echo 'Input a number between 1 to 4'
echo 'Your number is:\c'
read Num
case $Num in
1)
	echo 'You select 1'
	;;
2)
	echo 'You select 2'
	;;
3)
	echo 'You select 3'
	;;
4)
	echo 'You select 4'
	;;
*)
	echo 'You do not select a number between 1 to 4'
	;;
esac

echo '(2)------------------完美分割线---------------------'
read -p "请输入你要查询的城市房价排名名次:" number
case $number in
1)
	echo "2021年全国城市房价排行第1是:深圳  "
	;;
2)
	echo "2021年全国城市房价排行第2是:北京  "
	;;
3)
	echo "2021年全国城市房价排行第3是:上海  "
	;;
4)
	echo "2021年全国城市房价排行第4是:广州  "
	;;
5)
	echo "2021年全国城市房价排行第5是:杭州  "
	;;
6)
	echo "2021年全国城市房价排行第6是:三亚  "
	;;
7)
	echo "2021年全国城市房价排行第7是:南京  "
	;;
8)
	echo "2021年全国城市房价排行第8是:天津  "
	;;
9)
	echo "2021年全国城市房价排行第9是:珠海  "
	;;
*)
	echo "2021年全国城市房价排行第10是:东莞 "
	;;
esac

echo '(3)------------------完美分割线---------------------'
echo "*cmd menu* 1-date 2-ls 3-who 4-pwd 0-exit "
while :; do
	#捕获用户键入值
	read -p "please input number :" n
	n1=$(echo $n | sed s'/[0-9]//'g)
	#空输入检测
	if [ -z "$n" ]; then
		continue
	#非数字输入检测
	elif [ -n "$n1" ]; then
		echo "请输入数字1-4："
	fi
	break
done

case $n in
1)
	date
	;;
2)
	ls
	;;
3)
	who
	;;
4)
	pwd
	;;
*)
	echo "please input number is [1-4]"
	;;
esac

echo '(4) -----------------------------------------------------------'
read -p '请输入你的选择的信息[cpu|mem|hard]：' i
if [ $i == cpu ]; then
	echo -e "\e[1;32mcpu info is ：\e[0m"
	cat /proc/cpuinfo
elif [ $i == mem ]; then
	echo -e "\e[1;32mmem info is：\e[0m"
	cat /proc/meminfo
elif [ $i == hard ]; then
	echo -e "\e[1;32mharddisk info is：\e[0m"
	df -h
else
	echo -e "\e[1;31m请确认，你输入的信息有误!!!\e[0m"
fi

echo '(5) -----------------------------------------------------------'
read -p '请输入你的选择的信息[cpu|mem|hard]：' j
case $j in
cpu)
	echo -e "\e[1;32mcpu info is ：\e[0m"
	cat /proc/cpuinfo
	;;
mem)
	echo -e "\e[1;32mmem info is：\e[0m"
	cat /proc/meminfo
	;;
hard)
	echo -e "\e[1;32mharddisk info is：\e[0m"
	df -h
	;;
*)
	echo -e "\e[1;31m请确认，你输入的信息有误!!!\e[0m"
	;;
esac

echo '(6) -----------------------------------------------------------'
read -p "please input name:" name
read -p "please input sex(male|female):" sex
read -p "please input age:" age
case $sex in
    female)
    case $age in
        1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17)
        echo $name"gril, nice to meet you"
        ;;
        *)
        echo $name"lady, nice to meet you"
        ;;
     esac
     ;;
    male)
    case $age in
        1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17)
        echo $name" little boy, go home and study"
        ;;
        *)
        read -p $name" sir, Are you married?:" answer
        case $answer in
        Yes|married)
        echo "What do you want to do?"
        ;;
        No|not)
        read -p "Do you have a car and house?:" reply
         case $reply in
                Yes)
                echo "Let's get married. It's just the seventh day of today."
                 ;;
                No)
                 echo "sorry,I have something else to do..."
                 ;;
                 *)
                 echo "please answer this question"
                 ;;
                 esac
                 ;;
            *)
            echo "Are you married?"
             ;;
             esac
        ;;
        esac
        ;;
    *)
    echo "Are you from Thailand?"
    ;;
esac

