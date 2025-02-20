#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2024-07-30 15:49
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 12nginx_ctrl.sh
#######################################################
echo '(1)------------------完美分割线---------------------'
ngstart (){
	sudo systemctl start nginx
}

ngstop (){
	sudo systemctl stop nginx
}

ngrestart (){
	sudo systemctl restart nginx

}

ngstatus (){
	sudo systemctl status nginx
}


#nginx服务器起停的脚本

case $1 in
    start)
        echo "启动nginx服务"
        ngstart
;;
    stop)
        echo "关闭nginx服务"
        ngstop
;;
    restart)
    	echo "重启nginx服务"
#        $0 stop
#        $0 start
		ngrestart
;;
	status)
		echo "查看nginx服务状态"
		ngstatus
;;
    *)
        echo "USage: /etc/init.d/nginx {start|stop|restart}"
esac


