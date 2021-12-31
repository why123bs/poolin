#!/bin/bash

#Check NetWork
function network()
{
    
    local timeout=1

    
    local target=www.baidu.com

    #Get response code
    local ret_code=`curl -I -s --connect-timeout ${timeout} ${target} -w %{http_code} | tail -n1`

    if [ "x$ret_code" = "x200" ]; then
        #NetWork OK
        return 1
    else
        #NetWork not OK
        return 0
    fi

    return 0
}

network
if [ $? -eq 0 ];then
	echo "请检查您的网络，服务器无网络"
	exit -1
fi


ip=`hostname -I |awk '{print $1}'`
cat /work/init/Readme
echo "---------------------BTC 8001----------------"
echo "BTC矿池地址  stratum+tcp://$ip:8001"
echo "---------------------ETH 8005----------------"
echo "ETH矿池地址  stratum+tcp://$ip:8005"
echo "---------------------LTC 8002----------------"
echo "LTC矿池地址  stratum+tcp://$ip:8002"
echo "---------------------DASH 8003---------------"
echo "DASH矿池地址  stratum+tcp://$ip:8003"
echo "---------------------ZEC 6006----------------"
echo "ZEC矿池地址  stratum+tcp://$ip:6006"
echo "---------------------BCH 6010----------------"
echo "BCH矿池地址  stratum+tcp://$ip:6010"
echo "---------------------DCR 6012----------------"
echo "DCR矿池地址  stratum+tcp://$ip:6012"
echo "---------------------BSV 6017----------------"
echo "BSV矿池地址  stratum+tcp://$ip:6017"
echo "---------------------HNS 6020----------------"
echo "HNS矿池地址  stratum+tcp://$ip:6020"
echo "---------------------CKB 6023----------------"
echo "CKB矿池地址  stratum+tcp://$ip:6023"
echo "---------------------ZEN 6024----------------"
echo "ZEN矿池地址  stratum+tcp://$ip:6024"
echo "---------------------STC 6026----------------"
echo "STC矿池地址  stratum+tcp://$ip:6026"
