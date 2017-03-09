#!/bin/bash
# File Name: /etc/profile.d/login.sh
# Author:labulaka
# mail:labulaka521@live.cn
# Created Time: 2017-03-08
#判断用户是否在172.16.0.0这个网段中
#如果在则继续执行如果不在则退出
Net=`ifconfig enp2s0f1 | grep "inet addr" | sed 's/[:\.]/ /g'|awk '{print $3"."$4}'`
if [ $Net = 172.16 ];then
	break
else
	exit 0
fi
cd /home/labulaka/github/shell-hosts/nmap
nohup sh login.sh &
cd
