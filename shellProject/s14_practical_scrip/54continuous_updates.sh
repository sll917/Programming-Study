#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-10-24 22:24
# * Filename : 24batch_modify_file_name.sh 
# **********************************************************
# echo '(1)-----------------------完美分割线--------------------------------'
# 统计当前 Linux 系统中可以登录计算机的账户有多少个
#方法 1:
grep "bash$" /etc/passwd | wc -l

# echo '(2)-----------------------完美分割线--------------------------------'
#嵌套for循环
# for file in $(ls --file-type | grep ".*/$")   #批量修改目录名
# do
# 	for i in `seq 1 3`
# 	do
# 		mv ${file} $(echo ${file//python/p$i})
# 	done
# done

# echo '(3)-----------------------完美分割线--------------------------------'
#目的：把article改为bbs
#方法1：
# touch article_{1..3}.html
# ls -l *.html
# for file in $(ls *html); do
# 	mv $file bbs_${file#*_}
# mv $file $(echo $file |sed -r 's/.*(_.*)/bbs\1/')
# mv $file $(echo $file |echo bbs_$(cut -d_ -f2)
# done
# ls -l *.html
# sleep 5
# rm *.html

#方法2：
# touch article_{4..7}.html
# ls -l *.html
# for file in $(find . -name "*html$"); do
# 	mv $file bbs_${file#*_}
# done
# ls -l *.html
# sleep 5
# rm *.html

#批量修改后缀名
#dir=$1
#for file in `ls $1/*`
#do
#	mv $file $file.UP
#done

#方法3：
# rename article bbs *.html

# echo '(4)-----------------------完美分割线--------------------------------'
#把一个文档前五行中包含字母的行删掉，同时删除6到10行包含的所有字母
# 1）准备测试文件，文件名为sed_eg.txt
# 第1行1234567不包含字母
# 第2行56789BBBBBB
# 第3行67890CCCCCCCC
# 第4行78asdfDDDDDDDDD
# 第5行123456EEEEEEEE
# 第6行1234567ASDF
# 第7行56789ASDF
# 第8行67890ASDF
# 第9行78asdfADSF
# 第10行123456AAAA
# 第11行67890ASDF
# 第12行78asdfADSF
# 第13行123456AAAA

#2）脚本如下：
#把一个文档前五行中包含字母的行删掉，同时删除6到10行包含的所有字母
# sed -n '1,5'p sed_eg.txt | sed '/[a-zA-Z]/'d
# sed -n '6,10'p sed_eg.txt | sed s'/[a-zA-Z]//'g

# echo '(5)-----------------------完美分割线--------------------------------'
# 递归查找文件中的字符串
# sys_info=$(cat sn.txt)
# var=`echo  $sys_info | awk -F '{print $0}' | sed "s/,/ /g "`
# ip=$(echo $var | awk '{print $1}')
# netmask=$(echo $var | awk '{print $2}')
# gateway=$(echo $var | awk '{print $3}')
# db_ip=$(echo $var | awk '{print $4}')
# record_ip=$(echo $var | awk '{print $5}')

# echo '(6)------------------完美分割线---------------------'
# shell脚本实现查找文件夹下重复的文件,并提供删除功能
# 1.首先借助find命令扫描文件夹下类型为普通文件的所有文件，find命令的输出是一行一个文件
# 2.对find找到的所有文件进行MD5校验，校验命令为md5sum files，输出文本格式为：MD5SUM  *file
# 3.内容的文件的md5校验值是相同的，所有对MD5SUM校验值进行相同值查询，因此使用awk的关联数组，将不相同的文件输出
# 4.对awk输出重复的文件表进行删除。

#查找文件夹下相同的文件
#Usage: dupfile.sh [-ds] dirs
#       dirs 请用单引号引起来
# del=0
# silent=0
# trap "" PIPE
# 
# #参数处理
# while test $# -gt 0
# do
# 	case $1 in
# 		-d | --delete)
# 			del=1
# 			;;
# 		-s | --silent)
# 			silent=1
# 			;;
# 		-*)
# 			break
# 			;;
# 		*)
# 			break
# 			;;
# 	esac
# 	shift
# done
# 
# if [ $# -eq 0 ]
# then
# 	echo "Usage: dupfile.sh [-ds] dirs" >&2
# 	exit 0
# fi
 
#find查找所有文件并进行MD5校验,
#md5sum对二进制文件输出为 MD5SUM *file
#awk使用关联数组处理相同的md5值并按照格式输出,使用DEL传递参数
#tee命令将管道拷贝一份到进程替换,另一份到stdout
# find "$@" -type f -exec md5sum {} + |
# 	awk -v FS="*" -v DEL=$del -v SLT=$silent '
# 		{
# 			if($1 in md5)
# 				md5[$1] = md5[$1] "*" $2
# 			else
# 				md5[$1] = $2
# 		}
# 		END{
# 			for(key in md5)
# 			{
# 				if(DEL==0) K++
# 				n = split(md5[key], files, "*")
# 				if(SLT==1 && n==1) continue
# 				if(DEL==0)
# 					printf("%-*s  %s\n", length(key), key, files[n])
# 				for(n-- ;n>0 ; n--)
# 				{
# 					K++
# 					if(DEL==0)
# 						printf("%-*s  %s\n", length(key), "", files[n])
# 					else
# 						printf("\"%s\"\n", files[n])
# 				}
# 			}
# 			K = K>0 ? K : 0
# 			print "Total: " K " files"
# 		}' |
# 			tee >(
# 					if [ "$del" -eq 1 ]
# 					then
# 						xargs rm -f
# 					else
# 						tee >/dev/null
# 					fi
# 				 )

# echo '(7)------------------完美分割线---------------------'
# #用途：查找并删除重复文件，每个文件只保留一个样本
# 
# #将文件依据大小排序并输出
# ls -lS | awk 'BEGIN {
#  #得到第一行total总数并丢弃，读取下一行
#  getline;getline;
#  name1=$9;size=$5;
# }
# {
#  name2=$9;
#  if(size==$5)
#  #大小一样的可能是内容相同的文件
#  {
#   #用md5进行校验和
#   ("md5sum "name1)|getline; csum1=$1;
#   ("md5sum "name2)|getline; csum2=$1;
#   #如果校验和相同则为内容相同的文集，输出名字
#   if( csum1==csum2 )
#   {
#    {print name1;print name2}
#   }
#  };
#  size=$5;name1=name2;
# }' | sort -u > duplicate_files
# 
# #计算重复文件的md5sum，将重复文件中的一采样写入duplicate_sample中
# cat duplicate_files | xargs -I {} md5sum {} | sort | uniq -w 32 | awk '{print $2}' | sort -u >duplicate_sample
# 
# echo Removing...
# 
# #删除在duplicate_files中列出且未被duplicate_sample列出的全部文件
# comm duplicate_files duplicate_sample -2 -3 | tee /dev/stderr | xargs rm -rf
# echo Removed duplicates files successfully
# 
# find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum

# echo '(8)------------------完美分割线---------------------'
# 使用脚本循环创建三位数字的文本文件(111-999 的文件)
for i in {1..9}; do
	for j in {1..9}; do
		for k in {1..9}; do
			touch /tmp/$i$j$k.txt
		done
	done
done

# echo '(2)-----------------------完美分割线--------------------------------'
#嵌套for循环
# for file in $(ls --file-type | grep ".*/$")   #批量修改目录名
# do
# 	for i in `seq 1 3`
# 	do
# 		mv ${file} $(echo ${file//python/p$i})
# 	done
# done

# echo '(3)-----------------------完美分割线--------------------------------'
#目的：把article改为bbs
#方法1：
# touch article_{1..3}.html
# ls -l *.html
# for file in $(ls *html); do
# 	mv $file bbs_${file#*_}
# mv $file $(echo $file |sed -r 's/.*(_.*)/bbs\1/')
# mv $file $(echo $file |echo bbs_$(cut -d_ -f2)
# done
# ls -l *.html
# sleep 5
# rm *.html

#方法2：
# touch article_{4..7}.html
# ls -l *.html
# for file in $(find . -name "*html$"); do
# 	mv $file bbs_${file#*_}
# done
# ls -l *.html
# sleep 5
# rm *.html

#批量修改后缀名
#dir=$1
#for file in `ls $1/*`
#do
#	mv $file $file.UP
#done

#方法3：
# rename article bbs *.html

# echo '(4)-----------------------完美分割线--------------------------------'
#把一个文档前五行中包含字母的行删掉，同时删除6到10行包含的所有字母
# 1）准备测试文件，文件名为sed_eg.txt
# 第1行1234567不包含字母
# 第2行56789BBBBBB
# 第3行67890CCCCCCCC
# 第4行78asdfDDDDDDDDD
# 第5行123456EEEEEEEE
# 第6行1234567ASDF
# 第7行56789ASDF
# 第8行67890ASDF
# 第9行78asdfADSF
# 第10行123456AAAA
# 第11行67890ASDF
# 第12行78asdfADSF
# 第13行123456AAAA

#2）脚本如下：
#把一个文档前五行中包含字母的行删掉，同时删除6到10行包含的所有字母
# sed -n '1,5'p sed_eg.txt | sed '/[a-zA-Z]/'d
# sed -n '6,10'p sed_eg.txt | sed s'/[a-zA-Z]//'g

# echo '(5)-----------------------完美分割线--------------------------------'
# 递归查找文件中的字符串
# sys_info=$(cat sn.txt)
# var=`echo  $sys_info | awk -F '{print $0}' | sed "s/,/ /g "`
# ip=$(echo $var | awk '{print $1}')
# netmask=$(echo $var | awk '{print $2}')
# gateway=$(echo $var | awk '{print $3}')
# db_ip=$(echo $var | awk '{print $4}')
# record_ip=$(echo $var | awk '{print $5}')

# echo '(6)------------------完美分割线---------------------'
# shell脚本实现查找文件夹下重复的文件,并提供删除功能
# 1.首先借助find命令扫描文件夹下类型为普通文件的所有文件，find命令的输出是一行一个文件
# 2.对find找到的所有文件进行MD5校验，校验命令为md5sum files，输出文本格式为：MD5SUM  *file
# 3.内容的文件的md5校验值是相同的，所有对MD5SUM校验值进行相同值查询，因此使用awk的关联数组，将不相同的文件输出
# 4.对awk输出重复的文件表进行删除。

#查找文件夹下相同的文件
#Usage: dupfile.sh [-ds] dirs
#       dirs 请用单引号引起来
# del=0
# silent=0
# trap "" PIPE
# 
# #参数处理
# while test $# -gt 0
# do
# 	case $1 in
# 		-d | --delete)
# 			del=1
# 			;;
# 		-s | --silent)
# 			silent=1
# 			;;
# 		-*)
# 			break
# 			;;
# 		*)
# 			break
# 			;;
# 	esac
# 	shift
# done
# 
# if [ $# -eq 0 ]
# then
# 	echo "Usage: dupfile.sh [-ds] dirs" >&2
# 	exit 0
# fi
 
#find查找所有文件并进行MD5校验,
#md5sum对二进制文件输出为 MD5SUM *file
#awk使用关联数组处理相同的md5值并按照格式输出,使用DEL传递参数
#tee命令将管道拷贝一份到进程替换,另一份到stdout
# find "$@" -type f -exec md5sum {} + |
# 	awk -v FS="*" -v DEL=$del -v SLT=$silent '
# 		{
# 			if($1 in md5)
# 				md5[$1] = md5[$1] "*" $2
# 			else
# 				md5[$1] = $2
# 		}
# 		END{
# 			for(key in md5)
# 			{
# 				if(DEL==0) K++
# 				n = split(md5[key], files, "*")
# 				if(SLT==1 && n==1) continue
# 				if(DEL==0)
# 					printf("%-*s  %s\n", length(key), key, files[n])
# 				for(n-- ;n>0 ; n--)
# 				{
# 					K++
# 					if(DEL==0)
# 						printf("%-*s  %s\n", length(key), "", files[n])
# 					else
# 						printf("\"%s\"\n", files[n])
# 				}
# 			}
# 			K = K>0 ? K : 0
# 			print "Total: " K " files"
# 		}' |
# 			tee >(
# 					if [ "$del" -eq 1 ]
# 					then
# 						xargs rm -f
# 					else
# 						tee >/dev/null
# 					fi
# 				 )

# echo '(7)------------------完美分割线---------------------'
# #用途：查找并删除重复文件，每个文件只保留一个样本
# 
# #将文件依据大小排序并输出
# ls -lS | awk 'BEGIN {
#  #得到第一行total总数并丢弃，读取下一行
#  getline;getline;
#  name1=$9;size=$5;
# }
# {
#  name2=$9;
#  if(size==$5)
#  #大小一样的可能是内容相同的文件
#  {
#   #用md5进行校验和
#   ("md5sum "name1)|getline; csum1=$1;
#   ("md5sum "name2)|getline; csum2=$1;
#   #如果校验和相同则为内容相同的文集，输出名字
#   if( csum1==csum2 )
#   {
#    {print name1;print name2}
#   }
#  };
#  size=$5;name1=name2;
# }' | sort -u > duplicate_files
# 
# #计算重复文件的md5sum，将重复文件中的一采样写入duplicate_sample中
# cat duplicate_files | xargs -I {} md5sum {} | sort | uniq -w 32 | awk '{print $2}' | sort -u >duplicate_sample
# 
# echo Removing...
# 
# #删除在duplicate_files中列出且未被duplicate_sample列出的全部文件
# comm duplicate_files duplicate_sample -2 -3 | tee /dev/stderr | xargs rm -rf
# echo Removed duplicates files successfully
# 
# find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum
