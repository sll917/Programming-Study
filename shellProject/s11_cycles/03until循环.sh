#!/bin/bash
#======================================
# File name:shell_03until循环.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-07 00:23
#======================================
: '
until特点：条件为假就进入循环；条件为真就退出循环
until 循环执行一系列命令直至条件为 true 时停止。
until 循环与 while 循环在处理方式上刚好相反。

until expression   [ 1 -eq 1 ]  (( 1 >= 1 ))
	do
		command
		command
		...
	done
'

i=1
while [ $i -le 5 ]
do
	echo $i
	let i++
done
echo '-----------------------------------------'
i=1
until [ $i -gt 5 ]
do
	echo $i
	let i++
done


# 举例说明
# 使用until语句批量创建10个用户，要求stu1—stu5用户的UID分别为1001—1005；
# stu6~stu10用户的家目录分别在/rhome/stu6—/rhome/stu10

i=1
until [ $i -gt 10 ]
do
	if [ $i -le 5 ];then
		useradd -u $[1000+$i] stu$i && echo 123|passwd --stdin stu$i
	else
		[ ! -d /rhome ] && mkdir /rhome
		useradd -d /rhome/stu$i stu$i && echo 123|passwd --stdin stu$i
	fi
let i++
done
