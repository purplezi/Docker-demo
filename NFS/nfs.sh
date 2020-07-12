#!/bin/bash

client_ip=${CLIENT_IP}
srv_pr=${SERVER_PR}
srv_prw=${SERVER_PRW}

sudo mkdir -p "$srv_pr" "$srv_prw"

sudo chown nobody:nogroup "$srv_pr"
sudo chown nobody:nogroup "$srv_prw"

# 重启服务
sudo systemctl restart nfs-kernel-server

# 增加死循环，防止脚本退出
while true
do
	sleep 1
done