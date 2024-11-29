#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-12-28 15:11
# * Filename : 02while循环.sh
# **********************************************************
: '
while 表达式
	do
		command...
	done
	
while  [ 1 -eq 1 ] 或者 (( 1 > 2 ))
  do
     command
     command
     ...
 done
'

# 打印1-5数字
# FOR循环打印：
for ((i=1;i<=5;i++))
do
	echo $i
done

# while循环打印：
i=1
while [ $i -le 5 ]
do
	echo $i
	let i++
done

# 用while循环计算1-50的偶数和
#定义变量
sum=0
i=2
#循环打印1-50的偶数和并且计算后重新赋值给sum
while [ $i -le 50 ]
do
	let sum=sum+i
	let i+=2
done
#打印sum的值
echo "1-50的偶数和为:$sum"

# 应用案例
# 写一个30秒同步一次时间，向同步服务器10.1.1.250的脚本,如果同步失败，则进行邮件报警,每次失败都报警;同步成功,也进行邮件通知,但是成功100次才通知一次。
# 分析：
# 每个30s同步一次时间，该脚本是一个死循环
# while true;do 同步时间，然后休息30s（sleep 30）done
# 同步失败发送邮件
# 在do…done循环体之间加if…else…(判断同步失败还是成功)
# 同步成功100次发送邮件
# 统计成功次数——>count=0——>成功1次加+1——>let count++

#定义变量
count=0
ntp_server=10.1.1.250
while true
do
	rdate -s $ntp-server &>/dev/null
	if [ $? -ne 0 ];then
		echo "system date failed" |mail -s 'check system date'  sll@T480s
	else
		let count++
		if [ $[$count%100] -eq 0 ];then
		echo "system date successfull" |mail -s 'check system date'  sll@T480s && count=0
		fi
	fi
sleep 3
done

