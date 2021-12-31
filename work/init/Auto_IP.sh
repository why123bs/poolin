#!/bin/bash
File="/etc/netplan/00-installer-config.yaml"
if [  -f ${File}.bak ];then 
		mv $File.bak $File
		netplan apply
		echo "服务器ip已变更为自动获取，请悉知！！"
		netplan apply
else 
	echo "您的服务器ip未固定过，不需变更！！"
fi
