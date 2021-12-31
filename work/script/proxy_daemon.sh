#!/bin/bash

array_name=`docker ps | awk -F' {2,}' '{print $7}'`
for loop in $array_name
do
	if [ "$loop" == "proxy_eth" ];then
		HostCoin=eth
		DockerHPort=18005
	elif [ "$loop" == "proxy_btc" ];then
		HostCoin=btc
		DockerHPort=18001
	elif [ "$loop" == "proxy_ltc" ];then
		HostCoin=ltc
		DockerHPort=18002
	elif [ "$loop" == "proxy_dash" ];then
		HostCoin=dash
		DockerHPort=18003
	else
		HostCoin=
		DockerHPort=
	fi
	if [ -n "$HostCoin" ];then
	  Dfile="/work/script/logs/.${HostCoin}_proxy_daemon"
	  Dlogfile="/work/script/logs/.${HostCoin}_proxy_daemon.log"
	

	  MaxDuration=300

	  if [ ! -f $Dfile ]; then
        echo "1" > $Dfile
	  fi

	  res=`curl http://localhost:${DockerHPort}/ping`
	  lasttimestamp=`cat $Dfile`


	  echo $res `date +%Y%m%d%H%M%S` >>$Dlogfile
	  timestamp=`date +%Y%m%d%H%M%S`

	  if [ "$res" == "pong" ]; then
        echo $timestamp >$Dfile
	  else
        echo healthy check false `date +%Y%m%d%H%M%S` >>$Dlogfile
        duration=`expr ${timestamp} - ${lasttimestamp}`
        if [ $duration -ge $MaxDuration ]; then
                echo restrating.....  `date +%Y%m%d%H%M%S` >>$Dlogfile
                bash /work/script/run_${HostCoin}_proxy.sh
                
        fi
	  fi
	fi
done
