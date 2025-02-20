#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-11-12 11:37
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 24Print_files_or_dir.sh
#######################################################
echo '(1)------------------完美分割线---------------------'
#查找给定目录中存在的文件或文件夹的数量。
#利用 Linux find 命令来执行此操作。首先，您需要传递目录名称以从命令行搜索文件。
if [ -d "$@" ]; then
	echo "Files found: $(find "$@" -type f | wc -l)"
	echo "Folders found: $(find "$@" -type d | wc -l)"
else
	echo "[ERROR] Please retry with another folder."
	exit 1
fi

echo '(2)------------------完美分割线---------------------'
#有时您可能需要为某些操作查找最后更新的文件。
#下面的简单程序向我们展示了如何使用 awk 命令在 bash 中执行此操作。
#它将列出您当前工作目录中最后更新或创建的文件。
ls -lrt | grep ^- | awk 'END{print $NF}'

echo '(3)------------------完美分割线---------------------'
# 统计目录中以sh结尾文件总大小
# find . -name "*.sh" -exec du -k {} \; |awk '{sum+=$1}END{print sum}'
for size in $(ls -l *.sh | awk '{print $5}'); do
	sum=$(($sum + $size))
done
SUM=$(expr $sum / 1000)k
echo $SUM

echo '(4)------------------完美分割线---------------------'
#shell打印示例语句中字母数小于6的单词
for M in Bash also interprets a number of multi-character options.; do
	N=$(echo $M | wc -c)
	if [ $N -lt 6 ]; then
		echo $M
	fi
done

echo '(5)------------------完美分割线---------------------'
# 统计/home/sll/git/shell 有多少个文件,并显示这些文件名
# 使用 ls 递归显示所有,再判断是否为文件,如果是文件则计数器加 1
Path=~/gitee/shell/
sum=0
for I in $(ls -r $Prth); do
	if [ -f $I ]; then
		let sum++
		echo "文件名:$I"
	fi
done
echo "总文件数量为:$sum"
