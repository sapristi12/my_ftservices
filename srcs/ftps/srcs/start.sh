#!/bin/bash
mkdir -p /home/ftp/admin
adduser -h /home/ftp/admin -D admin
echo "admin:admin" | chpasswd
chown admin:admin /home/ftp/admin

/usr/sbin/vsftpd -opasv_address=172.17.0.2 /etc/vsftpd/vsftpd.conf
