#!/bin/bash

# 匿名用户访问FTP设置
# 创建匿名用户可访问的文件夹
anon_path=${ANON_PATH}
# -d filename 如果filename为目录则为真
if [[ ! -d "$anon_path" ]];
then
  mkdir -p "$anon_path"
fi

# 设置pub文件夹访问权限
chown nobody:nogroup "$anon_path"

# 设置用户名和密码方式访问的帐号
user=${FTP_USER}
# 添加用户
if [[ $(grep -c "^$user:" /etc/passwd) -eq 0 ]];then
  adduser $user
else
  echo "${user} already exists!..."
fi

# 创建用户目录
usr_path="/home/${user}/ftp"
if [[ ! -d "$usr_path" ]];
then
  mkdir "$usr_path"
else
  echo "${usr_path} already exists!..."
fi

# 设置目标主机用于FTP的范围
port_min=40000
port_max=50000
conf=/etc/vsftpd.conf
grep -q "pasv_min_port=" "$conf" && sed -i -e "/pasv_min_port=/s/^[#]//g;/pasv_min_port=/s/\=.*/=${port_min}/g" "$conf" || echo "pasv_min_port=${port_min}" >> "$conf"
grep -q "pasv_max_port=" "$conf" && sed -i -e "/pasv_max_port=/s/^[#]//g;/pasv_max_port=/s/\=.*/=${port_max}/g" "$conf" || echo "pasv_max_port=${port_max}" >> "$conf"

# 设置所有权
chown nobody:nogroup "$usr_path"
# 删除写权限
chmod a-w "$usr_path"
# 验证权限
ls -la "$usr_path"
# 为用户创建upload目录
usr_write_path="${usr_path}/upload"

if [[ ! -d "$usr_write_path" ]];
then
  mkdir "$usr_write_path"
else
  echo "${usr_write_path} already exists!..."
fi

chown "$user":"$user" "$usr_write_path"
ls -la "$usr_path"

# 判断vsftpd状态 启动服务
if pgrep -x "vsftpd" > /dev/null
then
  systemctl restart vsftpd
else
  systemctl start vsftpd
fi

# 增加死循环，防止脚本退出
while true
do
	sleep 1
done