# 使用Ubuntu 18.04 官方镜像
FROM ubuntu:18.04

MAINTAINER purplezi "654762676@qq.com"

LABEL Description="基于ubuntu18.04镜像搭建dns服务器"

# 把文件都加入到 /app 中
COPY . /app

# 设置工作路径
WORKDIR /app

# 安装软件
RUN apt-get update -y && \
    apt install -y bind9

# 拷贝配置文件
COPY named.conf.options /etc/bind/
COPY named.conf.local /etc/bind/
COPY db.cuc.edu.cn /etc/bind/

CMD systemctl start bind9