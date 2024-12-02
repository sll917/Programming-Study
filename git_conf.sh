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
git remote add gitee git@gitee.com:sll917/Study.git
git config --global user.name 'Sll917'
git config --global user.email 'sll917@outlook.com'
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub
