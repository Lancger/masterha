function alert()
{
    #url="https://oapi.dingtalk.com/robot/send?access_token=34b0db6986f96a0410cfb9cfd3b37ddd6f0c5569758050a020c213566d150b2f"
    url="https://oapi.dingtalk.com/robot/send?access_token=b13e1867001b57dcb96fd813417ecd43d72d3ac8b0a0bf33986b87d625917af2"

    res=`curl -s -L -H "Content-Type:application/json" -H "charset:utf-8" $url -d "
    {
    \"msgtype\":\"markdown\",
    \"markdown\":{
    \"title\":\"$1\",
    \"text\":\"[业务类型]：$1    
               [告警内容]：$2\"
    }
    }"`
}

if [ "$#" -ne 2 ];then
	echo "Usage: alert title content"
	exit 1
fi
alert "测试MHA数据库$1" "$2"
