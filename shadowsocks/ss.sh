#!/bin/bash
# File Name: ss.sh
# Author:labulaka
# mail:labulaka521@live.cn
# Created Time: 2017-03-20

m=0
n=0
URL_ss=https://labulaka.arukascloud.io/
ss_pid=`ps -ef|grep -v grep|grep sslocal|awk '{print $2}'`

curl -I $URL_ss
if [ $? -ne 0 ];then
	echo "please check interner"
	exit 0
fi

if [ -n $ss_pid ];then
	kill $ss_pid
fi

for ip in `curl -s $URL_ss | grep "<small>.*</small>" | grep -o "[0-9]\{3\}\.[0-9]\{3\}\.[0-9]\{3\}\.[0-9]\{3\}"`
do
ss_IP[($m)]=$ip
let m=m+1
done

for port in `curl -s $URL_ss | grep "<small>.*</small>" | grep -o "[0-9]\{5\}"`
do
ss_PORT[$n]=$port
let n=n+1
done

i=`echo $((RANDOM))|cut -b 2`
nohup sslocal -s ${ss_IP[($i)]} -p ${ss_PORT[($i)]} -b 127.0.0.1 -l 1080 -k labulaka.me -m aes-256-cfb >/dev/null 2>&1 &

