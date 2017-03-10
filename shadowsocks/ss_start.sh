#!/bin/bash
# File Name: ss_login.sh
# Author:labulaka
# mail:labulaka521@live.cn
# Created Time: 2017-03-09

cd /home/labulaka/shadowsocks
ls *.json >> .json
i=`shuf -n1 .json`
nohup sslocal -c $i & >/dev/null 2>&1
cd



