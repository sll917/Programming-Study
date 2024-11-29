#!/bin/bash
#功能描述(Description):测试某个网段内所有主机的连通性.
#在对命令进行扩展时,可以使用$()或者是反引号``.

net="192.168.4"
for i in $(seq 254)
do
    ping -c2 -i0.2 -W1 $net.$i &>/dev/null
    if [ $? -eq 0 ];then
		echo -e "\e[32m$net.$i is up.\e[0m"
    else
		echo -e "\e[31m$net.$i is down.\e[0m"
    fi
done

#for i in `seq 254`
#do
#    ping -c2 -i0.2 -W1 $net.$i &>/dev/null
#    if [ $? -eq 0 ];then
# 		 echo -e "\e[31m$net.$i is down.\e[0m"
#    else
# 		 echo -e "\e[31m$net.$i is down.\e[0m"
#    fi
#done
