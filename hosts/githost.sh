#!/bin/bash
# File Name: githost.sh
# Author:labulaka
# mail:labulaka521@live.cn
# Created Time: 2017-02-28

sudo cp /etc/hosts /etc/hosts.bak
echo "Checking Internet..."
ping -c 3 www.baidu.com >/dev/null 2>&1
if [ $? -eq 0 ];then
		echo "Internet success!"
	else
		echo "Internet fail"
		echo "please check internet..."
		exit 0
fi
mkdir -p /tmp/hosts
git clone https://github.com/racaljk/hosts.git /tmp/hosts/hosts1
git clone https://github.com/WUZHIQIANGX/hosts.git /tmp/hosts/hosts2
git clone https://github.com/vokins/yhosts.git /tmp/hosts/hosts3
cd /tmp/hosts
cat hosts1/hosts > hosts
cat hosts2/hosts >> hosts
cat hosts3/hosts >> hosts
sed -i "s/localhost/$(hostname)/g" hosts
sudo mv hosts /etc/hosts
cd ~
sudo rm -rf /tmp/hosts
sudo dos2unix /etc/hosts
