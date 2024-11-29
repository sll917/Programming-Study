#!/bin/bash
#Version:1.0
#功能描述(Description):使用函数与&后台进程实现多进程ping测试.

net="10.0.2"

multi_ping() {
    ping -c2 -i0.2 -W1 $1 &>/dev/null
    if [ $? -eq 0 ];then
        echo -e "\e[32m$1 is up.\e[0m"
    else
        echo -e "\e[31m$1 is down.\e[0m"
    fi
}

#通过循环反复调用函数并将其放入后台并行执行.
for i in {1..254}
do
    multi_ping $net.$i &
done
