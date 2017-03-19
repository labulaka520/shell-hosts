#!/bin/bash
# File Name: 1.sh
# Author:labulaka
# mail:labulaka521@live.cn
# Created Time: 2017-03-15

Arukas_IP=(
153.125.239.210
153.125.239.204
153.125.239.207
153.125.239.207
153.125.239.210
153.125.239.209
153.125.239.205
153.125.239.208
153.125.239.210
)
Arukas_PORT=(
31626
31934
31720
31616
31672
31838
31578
31306
31037
)

i=$(($RANDOM))
i=`echo $i|cut -b 2`
nohup sslocal -s ${Arukas_IP[($i)]} -p ${Arukas_PORT[($i)]} -b 127.0.0.1 -l 1080 -k 109097 -m aes-256-cfb >/dev/null 2>&1 &
