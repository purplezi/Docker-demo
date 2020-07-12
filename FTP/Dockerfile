# 使用Ubuntu 18.04 官方镜像
FROM ubuntu:18.04

MAINTAINER purplezi "654762676@qq.com"

LABEL Description="基于ubuntu18.04镜像搭建vsftpd服务器"

# 把文件都加入到 /app 中
COPY . /app

# 设置工作路径
WORKDIR /app

# 设置ftp默认用户名、密码和地址
ENV FTP_USER zzr
ENV FTP_PASS 1203
ENV ANON_PATH /var/ftp/pub 
ENV PASV_ADDRESS 127.0.0.1

# 设置传输端口范围，大于 1023即可
ENV PASV_MIN_PORT 40000
ENV PASV_MAX_PORT 50000

# 安装vsftpd/ftp软件
RUN apt-get update -y && \
    apt install -y vsftpd

# 拷贝配置文件
COPY vsftpd.conf /etc/vsftpd
COPY vsftpd.sh /usr/local/vsftpd/

RUN chmod +x /usr/local/vsftpd/vsftpd.sh

EXPOSE 20 21

# 进入容器时默认执行的命令
CMD ["/bin/sh", "/usr/local/vsftpd/vsftpd.sh"]