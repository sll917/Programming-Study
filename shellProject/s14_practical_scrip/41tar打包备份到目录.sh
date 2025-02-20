#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-06-17 18:17
# File Name: 57tar打包备份到目录.sh
# Email: sll917@outlook.com
# Version: V1.0
#######################################################
echo '(1)------------------------------------------'
# 制定目录路径,脚本自动将该目录使用 tar 命令打包备份到/tmp目录
read -p "请输入你要打包的目录名称：" Document
[ ! -d /tmp ] && mkdir /tmp
[ -z $Document ] && exit
if [ -d $Document ];then
  tar -czvf /tmp/${Document##*/}_`date +%Y%m%d`.tar.gz $Document
else
    echo "该目录不存在"
fi
