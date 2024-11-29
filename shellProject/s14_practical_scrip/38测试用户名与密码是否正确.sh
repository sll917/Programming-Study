#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-06-17 17:30
# File Name: 54测试用户名与密码是否正确.sh
# Email: sll917@outlook.com
# Version: V1.0
#######################################################
echo '(1)------------------------------------------'
# 测试用户名与密码是否正确
#用户名为 tom 并且密码为 123456,则提示登录成功,否则提示登录失败
read -p "请输入用户名:" user
read -p "请输入密码:" pass
if [ "$user" == 'sll' -a "$pass" == 'sll' ]; then
	echo "Login successful"
else
	echo "Login Failed"
fi

echo '(2)------------------------------------------'
# 循环测试用户名与密码是否正确
# 循环测试用户的账户名和密码,最大测试 3 次,输入正确提示登录成功,否则提示登录失败
# 用户名为 tom 并且密码为 123456
for i in {1..3}; do
	read -p "请输入用户名:" user
	read -p "请输入密码:" pass
	if [ "$user" == 'sll' -a "$pass" == 'sll' ]; then
		echo "Login successful"
		exit
	fi
done
echo "Login Failed"

