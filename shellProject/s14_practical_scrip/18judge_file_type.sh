#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-03-19 17:56
# * Filename : judge_file_type.sh
# **********************************************************
#1， 判断目录是否存在，不存在就新建.
echo -n "Enter directory name ->"
read dir
if [ -d "$dir" ]; then
	echo "Directory exists"
else
	$(mkdir $dir)
	# `mkdir $dir`
	echo "Directory created"
fi

#2， 判断文件是否...
read -p "please input a filename:" file
#判断file变量是否为空
if [ -z "$file" ]
then
	echo "error,please input a filename!"
	exit 1
#判断file的值是否存在
elif [ ! -e "$file" ]
then 
	echo "your input is not a file!"
	exit 2
elif [ -f "$file" ]
then 
	echo "your input is regulare file!"
elif [ -d "$file" ]
then 
	echo "your input is a directory!"
else
	echo "$file is an otrher file ! "
fi

#3，实例判断文件是否存在.
filename1=/mnt/res/vapp/appd.conf
#判断appd.conf是否存在
if [ -f  $filename1 ];
then
    echo -e "\e[32mappd.conf file exists\e[0m"
    echo -e "文件信息如下:\n--------------------"
    cat $filename1
else
    echo -e "\e[31mappd.conf file does not exist\e[0m"
fi

echo -e "\n---------------------------------------------------\n"
if [ $# -eq 0 ]; then
	echo "未输入任何参数,请输入参数"
	echo "用法:$0 [文件名|目录名]"
fi
if [ -f $1 ]; then
	echo "该文件,存在"
	ls -l $1
else
	echo "没有该文件"
fi
if [ -d $2 ]; then
	echo "该目录,存在"
	ls -ld $2
else
	echo "没有该目录"
fi

#4, 函数调用
function failure() {
    echo -e "\033[31m $1 \033[0m"       # red, failure
}

function success() {
    echo -e "\033[32m $1 \033[0m"        # green,success
}

function warning() {
    echo -e "\033[33m $1 \033[0m"       # yellow, warning
}

function check_username() {
  if [[ $(id -u "${USER_NAME}" 2> /dev/null) != "" ]]; then
    failure "您输入的用户已存在，该用户名不可用，请核对后重新输入！"
    return 1
  else
    success "您输入需要创建的用户名为：${USER_NAME}"
    return 0
  fi
}

while true; do
    read -r -p " 请输入需要创建的用户名,输入后按Enter继续:" USER_NAME
      if [[ -z ${USER_NAME} ]]; then
        failure "您必须输入需要创建的用户名！"
        continue
  fi
    read -r -p "您输入用户名为:${USER_NAME},请输入[y/n]确认:" USER_NAME_Confirm
      if [[ ${USER_NAME_Confirm} == "y" ]]; then
        check_username "${USER_NAME}"
        [[ $? -eq 0 ]] && break || continue
  fi
done

