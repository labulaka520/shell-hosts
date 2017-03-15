#!/bin/bash
# File Name: net-speeder.sh
# Author:labulaka
# mail:labulaka521@live.cn
# Created Time: 2017-03-15


apt-get install libpcap0.8 libnet1-dev  libpcap0.8-dev libnet1 gcc -y
wget https://github.com/snooda/net-speeder/archive/master.zip
unzip master.zip
cd net-speeder-master/
sh build.sh -DCOOKED
nohup ./net_speeder eth0 "ip" &
cd
wget --no-check-certificate https://raw.githubusercontent.com/labulaka521/shell-hosts/master/net-speeder/shadowsocks-go.sh
chmod +x shadowsocks-go.sh
./shadowsocks-go.sh
