#!/bin/bash
# File Name: check_ss.sh
# Author:labulaka
# mail:labulaka521@live.cn
# Created Time: 2017-03-10
echo "checking speed,please wait!"
cd /home/labulaka/shadowsocks
for i in `ls *.json`
do
	nohup sslocal -c $i & 
	echo $i >> speedtest.log
	proxychains4 speedtest >> speedtest.log 
	killall sslocal
done
clean
grep -E "Download:|\.json|Upload:" speedtest.log
