#!/bin/bash
#######################################################
# Author: liangliangSu
# Created typesime: 2023-08-29 20:44
# Email: sll917@outlook.com
# Version: V2.0
# File Name: chmod_chown.sh
#######################################################
: '
for i in $(find . *.sh -type f | grep -E ".sh$")
do
	chown -R sll:sll $i
	# 修改所属组
	chmod u+rwx $i 
	# 所有者加入可写可读可执行权限
	chmod g-wx $i
	chmod g+r $i
	# 所属组加入可写可读权限
	chmod o-wx $i 
	chmod o+r $i
	# others加入可读权限
done
	

for j in $(find . *.sh -type f | grep -E ".info$|.txt$")
do
	chown -R sll:sll $j
	# 修改所属组
	chmod u-x $j
	chmod u+rw $j
	# 所有者加入可写可读权限
	chmod g-x $j
	chmod g+rw $j
	# 所属组加入可读可写权限
	chmod o-wx $j
	chmod o+r $j
	# others加入可读可写权限
done
'
# upgrede record 2023-09-07
# input parameter
read -p '请输入修改的类型是 py,sh,txt,info,conf : ' types

# 1, defined function
function Chmod() {
	for i in $(find . *.${types} -type f 2>/dev/null | grep -E ".${types}$") ; do
		if [[ -e $i ]]; then
			chown -R sll:sll $i
			# 修改所属组
			chmod u+rwx $i
			# 所有者加入可写可读可执行权限
			# chmod g-wx $i
			chmod g+rwx $i
			# 所属组加入可写可读权限
			chmod o-wx $i
			chmod o+r $i
		# others加入可读权限
		else
			echo "No matching files found"
		fi
	done
}

# 2, call function
Chmod

