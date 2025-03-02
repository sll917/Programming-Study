#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-26 16:27
# * Filename : Welcome_note.sh
# **********************************************************
# 根据计算机当前时间,返回问候语,可以将该脚本设置为开机启动
# 00‐12 点为早晨,12‐18 点为下午,18‐24 点为晚上
# 使用 date 命令获取时间后,if 判断时间的区间,确定问候语内容

# 初始化变量
Time=$(date +%H)
msg=""

# 根据时间输出问候语
if [ "$Time" -le 12 ]; then
    msg="Good Morning $USER"
elif [ "$Time" -gt 12 ] && [ "$Time" -le 18 ]; then
    msg="Good Afternoon $USER"
else
    msg="Good Night $USER"
fi

# 输出当前时间和问候语
echo "当前时间是:$(date +"%Y-%m-%d %H:%M:%S")"
echo -e "\033[34m$msg\033[0m\n"
