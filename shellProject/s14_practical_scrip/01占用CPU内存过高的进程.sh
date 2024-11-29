#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-06-18 23:49
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 65找出占用CPU内存过高的进程.sh
#######################################################
echo '(1)------------------完美分割线---------------------'
echo "-------------------CUP占用前10排序--------------------------------"
ps -eo user,pid,pcpu,pmem,args --sort=-pcpu |head -n 10
echo "-------------------内存占用前10排序--------------------------------"
ps -eo user,pid,pcpu,pmem,args --sort=-pmem |head -n 10
