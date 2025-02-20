#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-26 11:47
# * Filename : check_root.sh
# **********************************************************
# 检测本机当前用户是否为超级管理员,如果是管理员,则使用 apt 安装 vim,
# 如果不是,则提示您非管理员(使用字串对比版本) 

if [ $USER == "root" ]
then
  apt install vim
else
    echo "您不是管理员,没有权限安装软件"
fi

# 检测本机当前用户是否为超级管理员,如果是管理员,则使用 apt 安装 vim,
# 如果不是,则提示您非管理员(使用 UID 数字对比版本)
if [ $UID -eq 0 ];then
	apt install vim
else
    echo "您不是管理员,没有权限安装软件"
fi
