#!/bin/sh

if [ $# -ne 1 ];then
	echo "Usage vip.sh {start|stop} " 
	exit 0
fi

if="eth0"
key=2
vip="192.168.56.200"


start_vip(){
/sbin/ifconfig $if:$key $vip/24;arping -A -c 1 $vip
}

stop_vip(){
/sbin/ifconfig $if:$key down
}

case $1 in 
"stop")
	stop_vip $2;
	;;
"start")
	start_vip $2;
	;;
*)
	echo "Usage vip.sh {start|stop} "
	;;
esac
