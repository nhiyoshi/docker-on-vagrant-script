#!/bin/sh

# Install Commands
yum -y install unzip git vim

# Disable SELinux
setenforce 0
sed -i 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

# Install Docker & docker-compose
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum makecache fast
yum install -y docker-ce
systemctl enable docker
systemctl start docker
curl -L https://github.com/docker/compose/releases/download/1.17.1/docker-compose-`uname -s`-`uname -m` > docker-compose
mv docker-compose /usr/local/bin/
chmod +x /usr/local/bin/docker-compose
echo "alias dc='docker-compose'" > /etc/profile.d/docker-compose.sh
chown root:root /etc/profile.d/docker-compose.sh
chmod 644 /etc/profile.d/docker-compose.shgpasswd -a vagrant docker
systemctl restart docker

