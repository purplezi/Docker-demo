# 使用Ubuntu 18.04 官方镜像
FROM ubuntu:18.04

MAINTAINER purplezi "654762676@qq.com"

LABEL Description="基于ubuntu18.04镜像搭建DHCP服务器"

# 把文件都加入到 /app 中
COPY . /app

# 设置工作路径
WORKDIR /app

# DHCP服务器配置
ENV SRV_IP 192.168.59.0
ENV NETMASK 255.255.255.0
ENV RANGE_L 192.168.59.150
ENV RANGE_H 192.168.59.200

# 安装isc-dhcp-server软件
RUN apt-get update -y && \
    apt install isc-dhcp-server -y

# 拷贝配置文件
COPY dhcpd.conf /etc/dhcp/
COPY isc-dhcp-server /etc/default/

# 进入容器时默认执行的命令
CMD systemctl start isc-dhcp-server