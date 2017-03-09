#!/bin/bash
# File Name: login.sh
# Author:labulaka
# mail:labulaka521@live.cn
# Created Time: 2017-03-02

#判断用户是否在172.16.0.0这个网段中
#如果在则继续执行如果不在则退出
Net=`ifconfig enp2s0f1 | grep "inet addr" | sed 's/[:\.]/ /g'|awk '{print $3"."$4}'`
if [ $Net = 172.16 ];then
	break
else
	exit 0
fi
while true
do
 	ping -w 3 -c 3 www.baidu.com >/dev/null 2>&1
	if [ $? -eq 0 ];then
		echo "internet success"
		sleep 10
	else
	user=`shuf -n1 usernum`
 	 curl -sd "DDDDD=$user&upass=888888&0MKKey=%B5%C7%C2%BC+Login" http://222.24.63.10 >/dev/null 2>&1
	fi
done
