#!/bin/sh
filename1=./appd.conf
filename2=./AC.conf
cd /mnt/res/vapp/
#判断appd.conf是否存在
if [ -f  $filename1 ];
then
    echo -e "\nappd.conf file exists"
    echo -e "\n------------------------------------------------------------"
    cat $filename1
    echo -e "\n------------------------------------------------------------\n"
else
    echo -e "appd.conf file does not exist"
fi
#判断AC.conf是否存在
if [ -f $filename2 ]; 
then
    echo -e "AC.conf file exists"
    echo -e "\n------------------------------------------------------------"
    cat $filename2
    echo -e "\n------------------------------------------------------------\n"
else
    echo -e "AC.conf file does not exist"
fi
