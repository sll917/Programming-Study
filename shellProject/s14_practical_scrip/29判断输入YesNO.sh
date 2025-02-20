#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-11-12 12:26
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 29判断输入YesNO.sh
#######################################################
echo '(1)------------------完美分割线---------------------'
# 判断用户输入的是 Yes 或 NO

read -p  "Are you sure?[y/n]:"  sure
case  $sure  in
  y|Y|Yes|YES)
    echo "you enter $sure"
    ;;
    n|N|NO|no)
     echo "you enter $sure"
     ;;
    *)
     echo "error";;
esac

