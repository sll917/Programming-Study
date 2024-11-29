#!/bin/bash
#功能描述(Description):测试某个网段内所有主机的连通性.

net="10.0.2"
for i in {1..254}
do
    ping -c2 -i0.2 -W1 $net.$i &>/dev/null
    if [ $? -eq 0 ];then
        echo -e "\e[32m$net.$i is up.\e[0m"
    else
        echo -e "\e[31m$net.$i is down.\e[0m"
    fi
done
