masterha_home=/etc/masterha
masterha_conf=$masterha_home/vip_app_default.cnf
#masterha_conf=$masterha_home/app_default.cnf
ip_inner=`ip a |grep -v "127.0.0.1"|grep inet[^6]|grep -E -o '([0-9]{1,3}\.){3}[0-9]{1,3}/[0-9]{1,2}'`

masterha_manager --conf=$masterha_conf --ignore_last_failover > $masterha_home/app1/logs/stdout.log 2>&1 

if [ $? -ne 0 ];then
    /etc/masterha/app1/scripts/alert.sh "mysql 主从切换" "$ip_inner's master is dead. but failover failed.check the log"
else
    /etc/masterha/app1/scripts/alert.sh "mysql 主从切换" "$ip_inner's mha manager finished"
fi
