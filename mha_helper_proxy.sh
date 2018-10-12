masterha_home=/etc/masterha
masterha_conf=$masterha_home/proxy_app_default.cnf
#masterha_conf=$masterha_home/app_default.cnf
ip_inner=`ifconfig -a | grep 'inet ' | cut -d ':' -f 2 |cut -d ' ' -f 1 | grep -v '^127'|grep -E '10.|172.16|192.168.|172.17.|172.18.|172.19.|172.20.|172.21.|172.22.|172.23.|172.24.|172.25.|172.26.|172.27.|172.28.|172.29.|172.30.|172.31.'`
masterha_manager --conf=$masterha_conf --ignore_last_failover > $masterha_home/app1/stdout.log 2>&1 
if [ $? -ne 0 ];then
        /etc/masterha/app1/scripts/alert.sh "mysql 主从切换" "$ip_inner's master is dead.but failover failed.check the log"
else
	/etc/masterha/app1/scripts/alert.sh "mysql 主从切换" "$ip_inner's mha manager finished"
fi
