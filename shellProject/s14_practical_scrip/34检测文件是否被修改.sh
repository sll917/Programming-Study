#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-06-17 12:18
# File Name: 33检测文件是否被修改.sh
# Email: sll917@outlook.com
# Version: V1.0
#######################################################
# 获取文件夹中文件md5列表
# find /home/ -type f -not \( -name '.*' \) -exec md5sum {} \;

# 定义要监控的配置文件路径
config_file="/home/sll/git/shell/s14_practical_scrip/adduser.conf"

# 获取配置文件的最后修改时间戳
last_modified=$(stat -c %Y "$config_file")

# 定义一个时间间隔（例如，5分钟）
interval=120

# 等待指定的时间间隔
sleep $interval

# 获取配置文件的当前修改时间戳
current_modified=$(stat -c %Y "$config_file")

# 比较最后修改时间戳和当前修改时间戳
if [ "$last_modified" -ne "$current_modified" ]; then
  echo "配置文件已被修改！"
  exit 1
else
  echo "配置文件未被修改。"
  exit 0
fi
