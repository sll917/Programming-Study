#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2024-09-02 22:08
# Email: sll917@outlook.com
# Version: V1.0
# File Name: conf_backup.sh 
#######################################################
sudo cp conf_files/vimrc /etc/vim
sudo cp conf_files/hosts /etc
sudo apt install nscd -y && sudo /etc/init.d/nscd restart
sudo cp conf_files/.bashrc ~
sudo apt install curl -y
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

