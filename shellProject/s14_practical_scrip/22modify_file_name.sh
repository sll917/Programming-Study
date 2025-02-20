#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-10-24 22:24
# * Filename : 22modify_name.sh 
# **********************************************************
Start=$(date +%s)
#1、 递归地搜索文件，删除所有重复项，仅保留第一个文件。
fdupes -rdN .

#删除所有空文件夹
find -type d -empty | xargs rm -rf 
#删除所有空文件
find . -name "*" -type f -size 0c | xargs rm -rf

IFS=$'\t\n'
# shell 中有一个叫做 Internal Field Seprator 的变量，简称 IFS，译为内置分隔符。
# 终端下通过 set | grep IFS 可以看到该变量的默认值是空格，制表符和换行符。
# IFS=$' \t\n'也就是说 shell 会默认以上述三种字符对字符串进行分隔。
 
#2、查找当前目录，并批量改名去掉空格、括号
dir1=$(ls --file-type | grep ".*/$")
for h in $dir1; do
	mv $h $(echo "$h" | sed "s/ //g" | sed "s/(/_/g" | sed "s/)//g") >/dev/null 2>&1
done

#3、按照排序重命名文件夹
# dir2=$(ls --file-type | grep ".*/$")
# i=1
# for j in $dir2; do
# 	a=$(echo $(basename $j))
# 	#使用文件目录的专有命令basename和dirname
# 	b=$(echo $(dirname $j))
# 	mv $b/$a $b/"_log"$i${a%%_*} >/dev/null 2>&1
# 	let "i++"
# done
#   
# IFS=$'\t\n'
 
#4、定义函数 : 循环查找文件，并批量改名去掉空格、括号
function FILES()
{
	for k in $(find . -type f) ;do
		mv $k $(echo "$k" | sed "s/ //g" | sed "s/(/_/g" | sed "s/)//g") >/dev/null 2>&1
	done
}
#调用函数FILES
FILES
# 
# #5、递归查找文件并重命名文件
# for u in csv xls xlsx ;do
# 	n=1
# 	for o in $(find -name "*.$u"); do
# 		p=$(echo $(basename $o))
# 		#使用文件目录的专有命令basename和dirname
# 		q=$(echo $(dirname $o))
# 		mv $q/$p $q/"log_"$n${p##*.$u}.$u >/dev/null 2>&1
# 		let "n++"
# 	done
# done
# 
# 
# read -p "请输入测试工站 BDP,CAL: " STR
# #6、复制有相同格式的文件到新建文件夹
# for v in csv xls xlsx txt ;do
# 	if [ -e sll_$v ]; then
# 		rm -rf sll_$v
# 		sleep 2
# 		mkdir sll_$v
# 		find -name "*.$v" -exec cp -r {} sll_$STR_$v \; >/dev/null 2>&1
# 	else
# 		mkdir sll_$v
# 		find -name "*.$v" -exec cp -r {} sll_$STR_$v \; >/dev/null 2>&1
# 	fi
# done
# 
# # cd sll_$STR
# # cat *.$STR > all_log.$STR
# # # cat all_log.$STR | sort | uniq -c > all_log_uniq.$STR
# # # cd ..
#  
# #7、在当前目录下及子目录（递归）查找字符串
# IFS=$'\r'
# # cat ../sn.txt | while read line; do
# # 	r=$(echo $line)
# 	# s=$(grep -rino "$r" . --exclude=sn.txt --exclude=log.txt)
# 	# echo "$s" | awk -F ":" '{print $0}' >> log.txt
# for r in $(awk '{print $1}' sn.txt); do
# 	s=$(grep -rino "$r" . --exclude-dir=sll_xls --exclude-dir=sll_xlsx --exclude-dir=sll_csv --exclude=sn.txt --exclude=log.txt)
# 	echo "$s" | awk -F ":" '{print $0}' >> log.txt
# done
# 
# #把Windows格式转化成Unix格式
# dos2unix log.txt 
# 
# #去掉文件中的空行
# sed -i '/^$/d' log.txt
 
End=$(date +%s)
Diff=$((End - Start))
echo Time taken to execute commands is $Diff seconds.
 
# find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum
