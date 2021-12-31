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

IPAndMASK=`ip addr |awk '/inet /' |sed -n '2p' |awk -F' ' '{print $2}' `
Name=`route | grep 'default' | awk '{print $8}'`
GATEWAY=`route -n| grep ${Name} |grep 'UG'| awk '{print $2}'`
File="/etc/netplan/00-installer-config.yaml"
if [  -f ${File}.bak ];then 
    echo "服务器ip已固定过，请勿重复操作 !!"
else
    cp $File $File.bak
    cat > $File <<EOF
network:
  ethernets:
    $Name:                            
      addresses:
      - $IPAndMASK                                 
      gateway4: $GATEWAY           
      nameservers:
        addresses:
        - 223.5.5.5                 
        - 119.29.29.29                 
  version: 2  
EOF
cat $File
sudo netplan apply
echo "-----------------------------------------"
echo "恭喜您，服务器ip固定成功 !! "
echo "注意：服务器固定之后，不能挪动，如果需要换路由，请更改为自动获取（教程上有）"
echo "-----------------------------------------"
fi		   

