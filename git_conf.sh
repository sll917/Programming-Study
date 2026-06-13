#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2024-11-26 23:01
# Email: sll917@outlook.com
# Version: V1.0
# File Name: git_conf.sh
#######################################################
sudo apt-get install -y git
git init
# gitee 地址
# git remote add gitee git@gitee.com:sll917/Study.git
# github 地址
git remote add github git@github.com:sll917/Programming-Study.git
git config --global user.name 'Sll917'
git config --global user.email 'sll917@outlook.com'
# ssh-key 生成指令
# ssh-keygen -t ed25519 -C "Gitee SSH Key"
cat ~/.ssh/id_ed25519.pub
