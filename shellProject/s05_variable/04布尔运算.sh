#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2024-09-01 13:25
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 04布尔运算.sh
#######################################################
echo '(1)------------------完美分割线---------------------'

: '
布尔运算符列表
运算符      说明                                            举例
! 非运算，  表达式为 true 则返回 false，否则返回 true。     [ ! false ] 返回 true。
-o 或运算， 有一个表达式为 true 则返回 true。     [ $a -lt 20 -o $b -gt 100 ] 返回true。
-a 与运算， 两个表达式都为 true 才返回 true。     [ $a -lt 20 -a $b -gt 100 ] 返回false
'

#布尔运算符
#先来看一个布尔运算符的例子：
#!/bin/sh
a=10
b=20
if [ $a != $b ]; then
	echo "$a != $b : a is not equal to b"
else
	echo "$a != $b: a is equal to b"
fi
if [ $a -lt 100 -a $b -gt 15 ]; then
	echo "$a -lt 100 -a $b -gt 15 : returns true"
else
	echo "$a -lt 100 -a $b -gt 15 : returns false"
fi
if [ $a -lt 100 -o $b -gt 100 ]; then
	echo "$a -lt 100 -o $b -gt 100 : returns true"
else
	echo "$a -lt 100 -o $b -gt 100 : returns false"
fi
if [ $a -lt 5 -o $b -gt 100 ]; then
	echo "$a -lt 100 -o $b -gt 100 : returns true"
else
	echo "$a -lt 100 -o $b -gt 100 : returns false"
fi
#运行结果：
#10 != 20 : a is not equal to b
#10 -lt 100 -a 20 -gt 15 : returns true
#10 -lt 100 -o 20 -gt 100 : returns true
#10 -lt 100 -o 20 -gt 100 : returns false
