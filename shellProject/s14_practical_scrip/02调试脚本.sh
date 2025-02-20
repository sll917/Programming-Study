#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-11-09 14:50
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 71调试脚本.sh
#######################################################
echo '(1)------------------完美分割线---------------------'
# 调试功能是每一种编程语言都应该实现的重要特性之一，当出现一些始料未及的情况时，用
# 它来生成脚本运行信息。调试信息可以帮你弄清楚是什么原因使得程序发生崩溃或行为异常。每
# 位系统程序员都应该了解Bash提供的调试选项。

#调试技巧
#1.使用bash命令参数调试
: '
bash [-xvn] test.sh
参数解释：
-x：将执行的脚本内容输出出来,可以看到执行的过程
-n：不执行脚本，检查脚本语法是否有问题，给出错误的提示
-v：执行脚本时，先将脚本的内容输出到屏幕上，再执行脚本，如果有错误给出错误提示
'
#示例
: '-n参数进行语法检查
'
#说明：不会执行脚本，只检查有无语法错误，如果没有检测到，就无输出
#[root@game scripts]# cat test7.sh
#!/bin/bash
#echo "guoke123"
#[root@game scripts]# sh -n test7.sh
#脚本没有语法错误，所以没有输出

#演示脚本存在语法错误
#!/bin/bash
#if [ `netstat -untpl | grep httpd | wc -l` -gt 0 ];then
#    echo "httpd is Running
#else
#    echo "httpd service down" | mail -s "httpd" 10588@qq.com
#    systemctl restart httpd
#fi
#[root@game scripts]# sh -n test1.sh
#test1.sh: line 5: unexpected EOF while looking for matching `"'
#test1.sh: line 8: syntax error: unexpected end of file
##提示：第5行结尾没有双引号

: '-v参数：打印错误
'
#[root@game scripts]# sh -v test1.sh
##!/bin/bash
#if [ `netstat -untpl | grep httpd | wc -l` -gt 0 ];then
#    echo "httpd is Running
#else
#    echo "httpd service down" | mail -s "httpd" 10588@qq.com
#    systemctl restart httpd
#fi
#test1.sh: line 5: unexpected EOF while looking for matching `"'
#test1.sh: line 8: syntax error: unexpected end of file

: '-x参数：打印执行过程
'
#!/bin/bash
#if [ `netstat -untpl | grep httpd | wc -l` -gt 0 ];then
#    echo "httpd is Running"
#else
#    echo "httpd service down" | mail -s "httpd" 10588@qq.com
#    systemctl restart httpd
#fi
##打印执行过程
#[root@game scripts]# sh -x test1.sh
#++ netstat -untpl
#++ wc -l
#++ grep httpd
#+ '[' 0 -gt 0 ']'
#+ echo 'httpd service down'
#+ mail -s httpd 10588@qq.com
#+ systemctl restart httpd

: '2.使用set命令调试
'
#    #常用选项
#    set -n ：读命令但并不执行
#    set -v ：显示读取的所有行
#    set -x ：显示所有命令及其参数
##使用
#使用set -x可以缩小调试的作用域范围
#set -x开启调试功能，set +x关闭调试功能
##示例
##!/bin/bash
#set -x
#for i in `seq 9`
#do
#    for n in `seq 9`
#    do
#	[ $i -ge $n ] && echo -en "$i x $n" = $(expr $i \* $n)
#    done
#set +x
#echo " "
#done
#[root@game scripts]# sh test6.sh
#++ seq 9
#+ for i in '`seq 9`'
#++ seq 9
#+ for n in '`seq 9`'
#+ '[' 1 -ge 1 ']'
#++ expr 1 '*' 1
#+ echo -en '1 x 1' = 1
#1 x 1 = 1+ for n in '`seq 9`'
#+ '[' 1 -ge 2 ']'
#......
#+ '[' 1 -ge 8 ']'
#+ for n in '`seq 9`'
#+ '[' 1 -ge 9 ']'
#+ set +x
##提示：只调试了set -x 和set +x 这个作用域
#3.echo命令调试
#一般在可能出现问题的脚本的重要部分加入echo命令
##示例
#[root@game scripts]# cat test8.sh
##!/bin/bash
#read -p "please input tow num:" a b
#echo $a $b
#exit
##执行效果
#[root@game scripts]# sh test8.sh
#please input tow num:1 2
#1 2
#4.bashdb
#    shell调试器bashdb是一个类似GDB的调试工具，可以完成对shell脚本的断点设置、单步执行、变量观察等许多功能。
#5.shellcheck
#    shellcheck是一个可检查sh/bash脚本和命令语法的小工具
##常见的shell脚本错误示例
##1.中括号两端没有空格
#[root@game scripts]# cat test.sh
##!/bin/bash
#yum install net-tools -y >/dev/null
#if [$? -eq 0]
#    then
#	echo "install success"
#    else
#	echo "install fail"
#fi
##执行：报错
#[root@game scripts]# sh test.sh
#test.sh: line 4: [0: command not found
#install fail
##提示：错误在第四行
##2.成对的符号没有写全，漏写
##成对的符号例如：()、[]、""、''等
##示例[]中括号没有写全
#[root@game scripts]# cat test1.sh
##!/bin/bash
#if [ `netstat -untpl | grep httpd | wc -l` -gt 0 ;then
#    echo "httpd is Running"
#else
#    echo "httpd service down" | mail -s "httpd" 10588@qq.com
#    systemctl restart httpd
#fi
##执行效果
#[root@game scripts]# sh test1.sh
#test1.sh: line 3: [: missing `]'
##3.if条件语句缺少结尾关键字
#[root@game scripts]# cat test2.sh
##!/bin/bash
#if [ `netstat -untpl | grep mysqld | wc -l` -gt 0 ];then
#    echo "mysqld is Running"
#else
#    echo "mysqld service down" | mail -s "mysqld" 1792988@qq.com
#    systemctl restart mysqld
##执行效果
#[root@game scripts]# sh test2.sh
#test2.sh: line 8: syntax error: unexpected end of file
##执行脚本会提示第8行语法错误
##4.循环语句缺少关键字
##示例1：for循环的done少了个e
#[root@game scripts]# cat test3.sh
##!/bin/bash
#usage(){
#    echo "directory not found"
#}
#[ ! -d /test ] && usage && exit 1
#cd /test
#for i in `ls`
#do
#    echo $i
#don
##执行效果
#[root@game scripts]# sh test3.sh
#test3.sh: line 13: syntax error: unexpected end of file
##示例2：if条件语句的then少了n
#[root@game scripts]# cat test2.sh
##!/bin/bash
#if [ `netstat -untpl | grep mysqld | wc -l` -gt 0 ];the
#    echo "mysqld is Running"
#else
#    echo "mysqld service down" | mail -s "mysqld" 1792988@qq.com
#    systemctl restart mysqld
#fi
##执行效果
#[root@game scripts]# sh test2.sh
#test2.sh: line 5: syntax error near unexpected token `else'
#test2.sh: line 5: `else'
##执行脚本之后会提示语法错误
##需要注意的是shell脚本解释器一般不会很精确的定位到错误，需要上下联都看一下
#总结

