#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-07-05 16:07
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 02read_usage.sh
#######################################################
echo '(1)------------------完美分割线---------------------'
: '
read:
read [-ers] [-a 数组] [-d 分隔符] [-i 缓冲区文字] [-n 读取字符数] [-N 读取字符数] [-p 提示符] [-t 超时] [-u 文件描述符] [名称 ...]
    从标准输入读取一行并将其分为不同的域。
    从标准输入读取单独的一行，或者如果使用了 -u 选项，从文件描述符 FD 中读取。
    该行被分割成域，如同词语分割一样，并且第一个词被赋值给第一个 NAME 变量，第二
    个词被赋值给第二个 NAME 变量，如此继续，直到剩下所有的词被赋值给最后一个 NAME
    变量。只有 $IFS 变量中的字符被认作是词语分隔符。
    如果没有提供 NAME 变量，则读取的行被存放在 REPLY 变量中。

    选项：
      -a array	将词语赋值给 ARRAY 数组变量的序列下标成员，从零开始
      -d delim	持续读取直到读入 DELIM 变量中的第一个字符，而不是换行符
      -e	使用 Readline 获取行
      -i text	使用 TEXT 文本作为 Readline 的初始文字
      -n nchars	读取 nchars 个字符之后返回，而不是等到读取换行符。
    		但是分隔符仍然有效，如果遇到分隔符之前读取了不足 nchars 个字符。
      -N nchars	在准确读取了 nchars 个字符之后返回，除非遇到文件结束符或者读超时，
    		任何的分隔符都被忽略
      -p prompt	在尝试读取之前输出 PROMPT 提示符并且不带
    		换行符
      -r	不允许反斜杠转义任何字符
      -s	不回显终端的任何输入
      -t timeout	如果在 TIMEOUT 秒内没有读取一个完整的行则超时并且返回失败。
    		TMOUT 变量的值是默认的超时时间。TIMEOUT 可以是小数。
    		如果 TIMEOUT 是 0，那么仅当在指定的文件描述符上输入有效的时候，
    		read 才返回成功；否则它将立刻返回而不尝试读取任何数据。
    		如果超过了超时时间，则返回状态码大于 128
      -u fd	从文件描述符 FD 中读取，而不是标准输入

    退出状态：
    返回码为零，除非遇到了文件结束符、读超时（且返回码不大于128）、
    出现了变量赋值错误或者无效的文件描述符作为参数传递给了 -u 选项。
'

read -t 7 -p "input your name " NAME
read -t 11 -p "input you age " AGE
read -t 15 -p "input your friend " FRIEND
read -t 16 -p "input your love " LOVE
echo $NAME
echo $AGE
echo $FRIEND
echo $LOVE

echo '(2)------------------完美分割线---------------------'
file='find_replace.txt'
while read line; do
	echo $line
done < $file
