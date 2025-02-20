#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-08-23 11:49
# * Filename : 21modify_string.sh
# **********************************************************
# 1,封装函数，实现批量修改文件中的字符串：
Modify_str() {
	read -p '请输入修改前旧的字符串: ' old_str
	read -p '请输入修改后新的字符串: ' new_str
	M=$(find . -name "*.csv")
	if [ $? == "0" ]; then
		for files in $M; do
			sed -i s/${old_str}/${new_str}/g "$files" 
# 			sed -i s/${old_str}/${new_str}/g "$files" 2>/dev/null
		done
	else
		echo "未找到匹配的文件,即将退出终端..."
		sleep 3
	fi
}

# 2,封装函数，实现批量查询文件中的字符串：
Find_str() {
	read -p '请输入需要查询的字符: ' query_str
	M=$(find . -name "*.csv")
	if [ $? == "0" ]; then
		for files in $M; do
			grep -rn "${query_str}" "${files}" | tee -a $(date +%Y-%m-%d_%H-%M)_log.log
			grep -rnl "${query_str}" "${files}" | tee -a $(date +%Y-%m-%d_%H-%M)_log.log
		done
	else
		echo "未找到匹配的文件,即将退出终端..."
		sleep 3
	fi
}

# 3,封装函数，实现批量查询文件中的字符串：
awk_str() {
	M=$(find . -name "*.csv")
	if [ $? == "0" ]; then
		for files in $M; do
			awk -F "," '{print $5}' "${files}" |sort -r |head -20 | tee -a $(date +%Y-%m-%d_%H-%M)_log.csv
		done
	else
		echo "未找到匹配的文件,即将退出终端..."
		sleep 3
	fi
}

echo -e "Input a number between 1 or 2 or 3;\n 1-修改字符串\n 2-查询字符串\n 3-awk打印例"
read -p "your number is:" Num
case $Num in
1)
	echo 'You select 1'
	Modify_str
	Find_str
	;;
2)
	echo 'You select 2'
	Find_str
	;;
3)
	echo 'You select 3'
	awk_str
	;;
*)
	echo 'You do not select a number between 1 or 2'
	;;
esac

