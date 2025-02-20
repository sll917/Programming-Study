#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-06-17 19:15
# File Name: 61找出中能登录的用户.sh
# Email: sll917@outlook.com
# Version: V1.0
#######################################################
echo '(1)------------------------------------------'
# 找出/etc/passwd 中能登录的用户,并将对应在/etc/shadow 中第二列密码提出处理

user=$(awk -F: '/bash$/{print $1}' /etc/passwd)
for i in $user
do
  awk -F: -v x=$i '$1==x{print $1,$2}' /etc/shadow
done

echo '(2)------------------------------------------'
# 统计/etc/passwd 中 root 出现的次数
#每读取一行文件内容,即从第 1 列循环到最后 1 列,依次判断是否包含 root 关键词,如果包含则 x++
awk -F: '{i=1;while(i<=NF){if($i~/root/){x++};i++}} END{print "root 出现次数为"x}' /etc/passwd
