#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-26 11:55
# * Filename : 实时显示流量.sh
# **********************************************************
echo '(1)------------------完美分割线---------------------'
# 查看网卡实时流量
read -p "请输入你的网卡名称:" network_card
Net=${network_card}
echo -e "In \t\t Out"
while true; do
	OLD_IN=$(awk '$0~"'$Net'"{print $2}' /proc/net/dev)
	OLD_OUT=$(awk '$0~"'$Net'"{print $10}' /proc/net/dev)
	sleep 1
	NEW_IN=$(awk '$0~"'$Net'"{print $2}' /proc/net/dev)
	NEW_OUT=$(awk '$0~"'$Net'"{print $10}' /proc/net/dev)
	IN=$(printf "%.1f%s" "$((($NEW_IN - $OLD_IN) / 1024))" "KB/s")
	OUT=$(printf "%.1f%s" "$((($NEW_OUT - $OLD_OUT) / 1024))" "KB/s")
	echo -e "$IN \t $OUT"
	sleep 1
done

echo '(2)------------------完美分割线---------------------'
# 使用死循环实时显示网卡发送的数据包流量
while :;do
	echo "本地网卡 $network_card 下载流量是："
	ifconfig $network_card | grep "RX pack" | awk '{print $5} Bytes/sec '
	echo "本地网卡 $network_card 上载流量是："
	ifconfig $network_card | grep "TX pack" | awk '{print $5} Bytes/sec'
    sleep 3
    echo '------------------------------------------------------'
done
