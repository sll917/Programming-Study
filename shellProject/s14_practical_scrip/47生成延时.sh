#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-11-09 14:41
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 70生成延时.sh
#######################################################
# 为了在脚本中推迟执行一段时间，可以使用sleep：$ sleep no_of_seconds.
# 例如，下面的脚本就使用tput和sleep从0开始计数到10：
echo -n Count:
tput sc
count=0
while true; do
	if [ $count -lt 10 ]; then
		let count++
		sleep 1
		tput rc
		tput ed
		echo -n $count
	else
		exit 0
	fi
done
# 在上面的例子中，变量count初始化为0，随后每循环一次便增加1。echo语句打印出count的值。
# 我们用tput sc存储光标位置。在每次循环中，通过恢复之前存储的光标位置，
# 在终端中打印出新的count值。
# 恢复光标位置的命令是tput rc。tput ed清除从当前光标位置到行尾之间的所有内容，
# 使得旧的count值可以被清除并写入新值。循环内的1秒钟延时是通过sleep命令来实现的。
