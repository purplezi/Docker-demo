# 创建工作组和系统用户
groupadd ${SMBGROUP}

# 创建用户 并且将用户加入到用户组
useradd -G ${SMBGROUP} ${SMBUSR}

# 修改密码
echo "${SMBUSR}:${SMBPW}" | chpasswd

# 创建samba用户
(echo ${SMBPW}; echo ${SMBPW}) | smbpasswd -a "${SMBUSR}"

# 解冻用户
sudo smbpasswd -e "$smbuser"

# 创建可访问的文件夹
sudo mkdir -p ${PUBPATH}
sudo chmod 777 ${PUBPATH}
# sudo chgrp sambashare ${PUBPATH}

sudo mkdir -p ${PRIPATH}
sudo chown ${SMBUSR}:${SMBGROUP} ${PRIPATH}
sudo chmod 2770 ${PRIPATH}

sudo service smbd restart