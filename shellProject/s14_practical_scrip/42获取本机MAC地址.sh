#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-06-17 19:01
# File Name: 59获取本机MAC地址.sh
# Email: sll917@outlook.com
# Version: V1.0
#######################################################
echo '(1)------------------------------------------'
: <<!
#实时监控本机内存和硬盘剩余空间,剩余内存小于500M&根分区剩余空间小于1000M时,发送报警邮件给root管理员

# 提取根分区剩余空间
disk_size=$(df / | awk '/\//{print $4}')

# 提取内存剩余空间
mem_size=$(free | awk '/Mem/{print $4}')

while :; do
	# 注意内存和磁盘提取的空间大小都是以 Kb 为单位
	if [ $disk_size -le 12000 ] && [ $mem_size -le 1024000 ]; then
		#    mail  ‐s  "Warning"  root  <<EOF
		#  Insufficient resources,资源不足
		# EOF
		echo -e "Insufficient resources,资源不足 \a"
	else
		echo -e "System status is normal"
	fi
	sleep 3
done
!

echo '(2)------------------完美分割线---------------------'
# 获取本机 MAC 地址
ip a s | awk 'BEGIN{print  "MAC Address:"}/^[0-9]/{print $2;getline;if($0~/link\/ether/){print $2}}' | grep -v lo:
# awk 读取 ip 命令的输出,输出结果中如果有以数字开始的行,先显示该行的地 2 列(网卡名称),
# 接着使用 getline 再读取它的下一行数据,判断是否包含 link/ether
# 如果保护该关键词,就显示该行的第 2 列(MAC 地址)
# lo 回环设备没有 MAC,因此将其屏蔽,不显示

