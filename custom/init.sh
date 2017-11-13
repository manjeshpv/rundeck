#!/bin/bash
# Linode
echo "1. Installing Repos"
yum install epel-release -y

echo "2. Updating repos"
yum update

echo "3. Installing git"
yum install git

echo "4. rDNS Host? ex: app1.quezx.com"
read host

echo "5. Adding gloryque user"
useradd gloryque

passwd gloryque

echo  "6. Adding user:gloryque to sudoers"
usermod gloryque -aG wheel

echo "7. Disabling root user login via ssh"
sed -i '/#PermitRootLogin yes/c\PermitRootLogin no' /etc/ssh/sshd_config

echo "8. Restarting ssh daemon"
systemctl restart sshd

echo "9. Setting up timezone to Asia/Kolkata"
rm /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

echo "10. Setting Hostname: $host"
hostname $host

echo "Successfully completed exiting... Thank you."
#exit
