#!/bin/bash

# change to /vagrant dir when log in as vagrant:
echo "cd /vagrant" >> /home/vagrant/.bashrc

# disable IPv6, seems to create network resolution troubles:
echo "Disabling IPv6"
echo "net.ipv6.conf.all.disable_ipv6 = 1
      net.ipv6.conf.default.disable_ipv6 = 1
      net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf
sysctl -p

mkdir -p /etc/docker/
cat <<EOF > /etc/docker/daemon.json
{
  "ipv6": false
}
EOF

# Install needed packages for docker:
apt-get update && apt-get dist-upgrade -y
apt-get install -y \
    curl \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Install docker:
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

usermod -aG docker vagrant

# Install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# finally, start all containers:
cd /vagrant
docker-compose up -d