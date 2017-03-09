#!/bin/bash
# File Name: check-wifi.sh
# Author:labulaka
# mail:labulaka521@live.cn
# Created Time: 2017-03-06
clear
for i in `seq 2 254`
do
	ping -w 1 -c 1 10.42.0.$i >/dev/null
	if [ $? -eq 0 ];then
		echo "10.42.0.$i online"
	fi
done
