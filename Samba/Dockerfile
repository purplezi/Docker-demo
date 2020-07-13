# 使用Ubuntu 18.04 官方镜像
FROM ubuntu:18.04

MAINTAINER purplezi "654762676@qq.com"

LABEL Description="基于ubuntu18.04镜像搭建samba服务"

# 把文件都加入到 /app 中
COPY . /app

# 设置工作路径
WORKDIR /app

# 环境变量
ENV SMBUSER demousr 
ENV SMBGROUP demogroup
ENV SMBPW demousr
ENV PUBPATH /home/samba/pub/
ENV PRIPATH /home/samba/pri/

# 安装软件
RUN apt-get update && /
    apt-get install -y samba

# 拷贝
COPY smb.conf /etc/samba/
COPY samba.sh /usr/local/samba/

RUN chmod +x /usr/local/samba/samba.sh

# 进入容器时默认执行的命令
CMD ["/bin/sh", "/usr/local/samba/samba.sh"]