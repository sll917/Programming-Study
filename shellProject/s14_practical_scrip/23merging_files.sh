#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-11-11 16:05
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 23merging_Documents.sh
#######################################################
echo '(1)------------------完美分割线---------------------'
# 1、开始即时
Start=$(date +%s)

# 2、删除所有空文件夹
# find -type d -empty | xargs rm -rf
#删除所有空文件
# find . -name "*" -type f -size 0c | xargs rm -rf

IFS=$'\t\n'
#shell 中有一个叫做 Internal Field Seprator 的变量，简称 IFS，译为内置分隔符。终端下通过 set | grep IFS 可以看到该变量的默认值是空格，制表符和换行符。IFS=$' \t\n'也就是说 shell 会默认以上述三种字符对字符串进行分隔。

#3、查找当前目录，并批量改名去掉空格、括号
# dir1=$(ls --file-type | grep ".*/$")
# for h in $dir1; do
# 	mv $h $(echo "$h" | sed "s/ //g" | sed "s/(/_/g" | sed "s/)//g") >/dev/null 2>&1
# done

#4、定义函数 : 循环查找文件，并批量改名去掉空格、括号
function FILES()
{
	M=$(find . -type f)
	for N in $M ;do
		mv "$N" $(echo "$N" | sed "s/ //g" | sed "s/(/_/g" | sed "s/)//g") >/dev/null 2>&1
	done
}
#调用函数FILES
FILES

read -p "请输入需要合并文件格式的后缀xls,csv...: " STR
# 5、合并文件
F=$(find -name "*.$STR" -type f)
cat $F > all_log.$STR
if [ -f all_log_uniq.$STR ];then
	rm -f all_log_uniq.$STR
# 	sleep 1
	cat all_log.$STR | sort -u > all_log_uniq.$STR
else
cat all_log.$STR | sort -u > all_log_uniq.$STR
fi
rm all_log.$STR

# 6、在当前目录下及子目录（递归）查找字符串
 IFS=$'\r'  # 对回车符进行分割
# for R in $(awk '{print $1}' sn.txt); do
# 	S=$(grep -rino "$R" . --exclude=sn.txt --exclude=log.txt --exclude=all_log_uniq.$STR)
# 	if [ -f log.txt ];then
# 		rm log.txt
# 		sleep 1
# 		echo "$S" | awk -F ":" '{print $0}' >> log.txt
# 	else
# 		echo "$S" | awk -F ":" '{print $0}' >> log.txt
# 	fi
# done

#把Windows格式转化成Unix格式
# dos2unix log.txt
#
#去掉文件中的空行
# sed -i '/^$/d' log.txt

End=$(date +%s)
Diff=$((End - Start))
echo Time taken to execute commands is $Diff seconds.
