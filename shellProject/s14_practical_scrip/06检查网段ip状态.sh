#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-26 12:04
# * Filename : check_ip_status.sh
# **********************************************************
echo "(1)---------------------------------------------------"
# 编写脚本测试 x.x.x.0/xxx 整个网段中哪些主机处于开机状态,哪些主机处于关机
# 状态(for 版本)
read -p "请输入你需要检测的网段IP地址前3数字:" num
for i in $(seq 1 20); do
	ping -c 2 -i 0.3 -W 1 $num.$i &>/dev/null

	if [ $? -eq 0 ]; then
		echo -e "\e[32m$num.$i is up \e[0m"
		echo "$num.$i" >>/tmp/up.txt

	else
		echo -e "\e[31m$num.$i is down \e[0m"
		echo "$num.$i" >>/tmp/down.txt
	fi
done

echo "(2)---------------------------------------------------"
# 编写脚本测试 x.x.x.0/xxx 整个网段中哪些主机处于开机状态,哪些主机处于关机
# 状态(while 版本)
read -p "请输入你需要检测的网段IP地址前3数字:" num
i=1
while [ $i -le 25 ]; do
	ping -c 2 -i 0.3 -w 1 $num.$i &>/dev/null
	if [ $? -eq 0 ]; then
		echo -e "\e[32m$num.$i is up \e[0m"
		echo "$num.$i" >>/tmp/up.txt
	else
		echo -e "\e[31m$num.$i is down \e[0m"
		echo "$num.$i" >>/tmp/down.txt
	fi
	let i++
done

echo "(3)---------------------------------------------------"
#判断ip的是否符合规则
function check_IP() {
	IP=$1
	if [[ $IP =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
		FIELD1=$(echo $IP | cut -d. -f1)
		FIELD2=$(echo $IP | cut -d. -f2)
		FIELD3=$(echo $IP | cut -d. -f3)
		FIELD4=$(echo $IP | cut -d. -f4)
		if [ $FIELD1 -le 255 -a $FIELD2 -le 255 -a $FIELD3 -le 255 -a $FIELD4 -le 255 ]; then
			echo "$IP available."
		else
			echo "$IP unavailable!"
		fi
	else
		echo "Format error!"
	fi
}
check_IP 10.0.2.2
check_IP 256.1.1.1

echo "(4)---------------------------------------------------"
#判断ip的是否符合规则
function check_ip() {
	local IP=$1
	VALID_CHECK=$(echo $IP | awk -F. '$1<=255&&$2<=255&&$3<=255&&$4<=255{print "yes"}')
	if echo $IP | grep -E "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$" >/dev/null; then
		if [[ ${VALID_CHECK} == "yes" ]]; then
			echo -e "\e[32m $IP available! \e[0m"
			return 0
		else
			echo -e "\e[31m $IP unavailable! \e[0m"
			return 1
		fi
	else
		echo "Format error! Please input again."
		return 1
	fi
}
while true; do
	read -p "Please enter IP: " IP
	check_ip $IP
	[ $? -eq 0 ] && break || continue
done

# 编写脚本测试 192.168.4.0/24 整个网段中哪些主机处于开机状态,哪些主机处于关机
# 状态(多进程版)
#定义一个函数,ping 某一台主机,并检测主机的存活状态
myping(){
ping -c 2 -i 0.3 -W 1 $1  &>/dev/null
if  [ $? -eq 0 ];then
  echo "$1 is up"
else
  echo "$1 is down"
fi
}
for i in {1..254}
do
     myping 10.0.2.$i &
done
# 使用&符号,将执行的函数放入后台执行
# 这样做的好处是不需要等待ping第一台主机的回应,就可以继续并发ping第二台主机,依次类推。
