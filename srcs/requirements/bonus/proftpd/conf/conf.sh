#! /bin/bash

if [ ! id -u ${FTP_USER} &> /dev/null ]
then
	useradd ${FTP_USER} --password=${FTP_PWD}
	groupadd ftpuser
	usermod -aG ftpuser ${FTP_USER}
fi
exec proftpd -n -q
