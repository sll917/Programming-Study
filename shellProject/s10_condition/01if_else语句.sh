#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2024-07-30 21:22
# * Filename : 01if_else语句.sh
# **********************************************************
: '
if 语句通过关系运算符判断表达式的真假来决定执行哪个分支,Shell 有三种 if ... else语句：
- if ... fi 语句；
- if ... else ... fi 语句；
- if ... elif ... else ... fi 语句;
'

: '
1) if ... else 语句
if ... else 语句的语法：
if [ expression ]
then
    Statement(s) to be executed if expression is true
fi
如果 expression 返回 true，then 后边的语句将会被执行；如果返回 false，不会执行任何语句。
最后必须以 fi 来结尾闭合 if，fi 就是 if 倒过来拼写，后面也会遇见。
注意：expression 和方括号([ ])之间必须有空格，否则会有语法错误。
'
#举个例子：
echo '(1) -----------------------------------------------------------'
a=10
b=20
if [ $a == $b ]; then
	echo "a is equal to b"
fi
if [ $a != $b ]; then
	echo "a is not equal to b"
fi
#运行结果：
#a is not equal to b

: '
2) if ... else ... fi 语句
if ... else ... fi 语句的语法：
if [ expression ]
then
    Statement(s) to be executed if expression is true
else
    Statement(s) to be executed if expression is not true
fi
如果 expression 返回 true，那么 then 后边的语句将会被执行；否则，执行 else 后边的语句。
'
echo '(2) -----------------------------------------------------------'
#举个例子：
a=10
b=20
if [ $a == $b ]; then
	echo "a is equal to b"
else
	echo "a is not equal to b"
fi
#执行结果：
#a is not equal to b

: '
3) if ... elif ... else ... fi 语句
if ... elif ... else ... fi 语句可以对多个条件进行判断，语法为：
if [ expression 1 ]
then
    Statement(s) to be executed if expression 1 is true
elif [ expression 2 ]
then
    Statement(s) to be executed if expression 2 is true
elif [ expression 3 ]
then
    Statement(s) to be executed if expression 3 is true
else
    Statement(s) to be executed if no expression is true
fi
'
#哪一个 expression 的值为 true，就执行哪个 expression 后面的语句；如果都为 false，那么不执行任何语句。
echo '(3) -----------------------------------------------------------'
#举个例子：
a=10
b=20
if [ $a == $b ]; then
	echo "a is equal to b"
elif [ $a -gt $b ]; then
	echo "a is greater than b"
elif [ $a -lt $b ]; then
	echo "a is less than b"
else
	echo "None of the condition met"
fi
#运行结果：
#a is less than b

echo '(4) -----------------------------------------------------------'
echo "entr number:"
read n
if [[ $n -lt 10 ]]; then
	echo "It is a 1 digit number"
elif [[ $n -ge 10 && $n -lt 100 ]]; then
	echo "It is a 2 digit number"
elif [ $n -ge 100 ] && [ $n -lt 1000 ]; then
	echo "It is a 3 digit number"
elif [ $n -ge 1000 ] && [ $n -lt 10000 ]; then
	echo "It is a 4 digit number"
else
	echo -e "This is a number with more than 5 digits"
fi

echo '(5) -----------------------------------------------------------'
DIR=mnt
FILES=${PWD}/mnt/sys/AC.conf

#判目录是否存在
if [ -d $DIR ]; then
	echo -e "\033[32mthis $DIR is exist , please exit!\033[0m"
else
	mkdir -p $DIR
	echo -e "\033[33mthis $DIR create success!\033[0m"
	ls $DIR
fi

#2判断文件是否存在
if [ -f $FILES ]; then
	echo -e "\033[32mthis $FILES is exist , please exit!\033[0m"
else
	touch $FILES
	echo -e "\033[33mthis $FILES create success!\033[0m"
	cat $FILES
fi

for i in $DIR $FILES; do
	if [ -f $i ]; then
		echo "$i is regular file!"
	elif [ -d $i ]; then
		echo "$i is directory!"
	else
		echo "$i is not regular file and directory"
	fi
done

: '
嵌套条件
if [ condition1 ];then
		command1
		if [ condition2 ];then
			command2
		fi
	else
		if [ condition3 ];then
			command3
		elif [ condition4 ];then
			command4
		else
			command5
		fi
fi
注释：
如果条件1满足，执行命令1；如果条件2也满足执行命令2，如果不满足就只执行命令1结束；
如果条件1不满足，不看条件2；直接看条件3，如果条件3满足执行命令3；如果不满足则看条件4，如果条件4满足执行命令4；否则执行命令5
'

#if [ $# -eq 0 ];then
#	echo "未输入任何参数,请输入参数"
#	echo "用法:$0 [文件名|目录名]"
#fi
#if [ -f $1 ];then
#  echo "该文件,存在"
#  ls -l $1
#else
#  echo "没有该文件"
#fi
#if [ -d  $2 ];then
#     echo "该目录,存在"
#     ls -ld  $2
#else
#     echo "没有该目录"
#fi

