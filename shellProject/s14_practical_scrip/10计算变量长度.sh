#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-03 15:06
# * Filename : 计算变量长度.sh
# **********************************************************
echo '(1)-----------------------完美分割线--------------------------------'
name=liangliangSu
echo $name
echo $name | wc -L
echo '(2)-----------------------完美分割线--------------------------------'
expr length "$name"
echo '(3)-----------------------完美分割线--------------------------------'
echo "$name" | awk '{print length($0)}'
echo '(4)-----------------------完美分割线--------------------------------'
echo ${#name}
