#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-26 11:23
# * Filename : base_SW_conf.sh 
# **********************************************************
echo -e "\n$(date "+%Y-%m-%d-%T") --- 开始工作\n"
sudo apt-get update && sudo apt-get -y upgrade 
sudo apt-get -y install vim git tree terminator manpages-zh curl wget shfmt shellcheck cutecom adb

#1, 定义安装系统的类型:
function Non_virtual_sys(){
	sudo apt-get -y install axel samba cmake build-essential gdb lnav unrar net-tools openssh-server vsftpd fdupes meld fortunes-zh sl 
	if [ $? == 0 ];then
		echo -e "\e[32m SW install successful ！\e[0m"
	else 
		echo -e "\e[31m SW install unsuccessful ！\e[0m"
	fi
}

function virtual_sys(){
	sudo apt-get -y install axel samba cmake build-essential gdb lnav unrar net-tools openssh-server vsftpd fdupes meld fortunes-zh sl 
	if [ $? == 0 ];then
		echo -e "\e[32m SW install successful ！\e[0m"
	else 
		echo -e "\e[31m SW install unsuccessful ！\e[0m"
	fi
}

#2, 选择安装系统的类型:
echo -e 'Input a number between 1 to 2 \n 1) Non_virtual_sys; \n 2) virtual_sys.'
#echo -e 'Your number is: '
echo -e 'Your number is: \c '
read Num
case $Num in
1)
	Non_virtual_sys
	;;
2)
	virtual_sys
	;;
*)
	echo 'You do not select a number between 1 to 2'
	;;
esac

#3, 安装python3环境：
: '
国内常用镜像源
清华大学 ：https://pypi.tuna.tsinghua.edu.cn/simple/
阿里云：http://mirrors.aliyun.com/pypi/simple/
中国科学技术大学 ：http://pypi.mirrors.ustc.edu.cn/simple/
华中科技大学：http://pypi.hustunique.com/
豆瓣源：http://pypi.douban.com/simple/
腾讯源：http://mirrors.cloud.tencent.com/pypi/simple
华为镜像源：https://repo.huaweicloud.com/repository/pypi/simple/
-----------------------------------------------------------------
1、临时使用
pip install [包名] -i [pip源URL]
# 示例
pip install pytest -i https://pypi.tuna.tsinghua.edu.cn/simple
# 或
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pytest
# 或
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

#2、永久使用
#前提pip版本 (>=10.0.0) 方可使用此命令进行配置：
#升级 pip 到最新的版本
pip install pip -U
# 或
# python -m pip install --upgrade pip
#修改pip源为清华源
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
'
sudo apt install -y python3-pip 
pip install pip -U
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip install numpy pandas scipy matplotlib ycmd

#install edge wechat teams localsend
apt list |grep -i microsoft-edge-stable
if [ "$?" == "0" ];then
	echo "microsoft-edge was installed"
else
	wget https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_131.0.2903.70-1_amd64.deb && sudo dpkg -i microsoft-edge*.deb && rm microsoft-edge*.deb
fi

apt list |grep -i wechat
if [ "$?" == "0" ];then
	echo "wechat was installed"
else
	wget https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.deb && sudo dpkg -i WeChatLinux*.deb && rm WeChatLinux*.deb
fi

sudo snap install teams-for-linux --edge

sudo apt install gir1.2-ayatanaappindicator3-0.1 gir1.2-appindicator3-0.1
apt list |grep -i localsend
if [ "$?" == "0" ];then
	echo "localsend was installed"
else
	wget https://github.com/localsend/localsend/releases/download/v1.16.1/LocalSend-1.16.1-linux-x86-64.deb && sudo dpkg -i LocalSend-*.deb && rm LocalSend-*.deb
fi

sudo apt-get autoremove && sudo apt-get autoclean
echo -e "\n$(date "+%Y-%m-%d-%T") --- 结束工作\n"

: ' last update in 2024-09-02 20:53'
# others remark
# 列出所有可更新的软件清单命令：sudo apt update
# 升级软件包：sudo apt upgrade
# 列出可更新的软件包及版本信息：apt list --upgradeable
# 升级软件包，升级前先删除需要更新软件包：sudo apt full-upgrade
# 安装指定的软件命令：sudo apt install <package_name>
# 安装多个软件包：sudo apt install <package_1> <package_2> <package_3>
# 更新指定的软件命令：sudo apt update <package_name>
# 显示软件包具体信息,例如：版本号，安装大小，依赖关系等等：sudo apt show <package_name>
# 删除软件包命令：sudo apt remove <package_name>
# 清理不再使用的依赖和库文件: sudo apt autoremove
# 移除软件包及配置文件: sudo apt purge <package_name>
# 查找软件包命令： sudo apt search
# 列出所有已安装的包：apt list --installed
# 列出所有已安装的包的版本信息：apt list --all-versions
