# 使用Ubuntu 18.04 官方镜像
FROM ubuntu:18.04

MAINTAINER purplezi "654762676@qq.com"

LABEL Description="基于ubuntu18.04镜像搭建nfs服务器"

# 把文件都加入到 /app 中
COPY . /app

# 设置工作路径
WORKDIR /app

# 设置nfs的一些参数
ENV CLIENT_IP 192.168.71.103
ENV SERVER_PR /var/nfs/gen_r
ENV SERVER_PRW /var/nfs/gen_rw

# 安装nfs-kernel-server
RUN apt-get update -y && \
    apt install -y nfs-kernel-server

# 拷贝配置文件
COPY exports /etc/
COPY nfs.sh /usr/local/nfs/

RUN chmod +x /usr/local/nfs/nfs.sh

# 进入容器时默认执行的命令
CMD ["/bin/sh", "/usr/local/nfs/nfs.sh"]