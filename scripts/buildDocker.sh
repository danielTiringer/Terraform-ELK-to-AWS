#!/bin/bash

# Install dependencies and Docker
apt install -yy git curl
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Create an user for password only connection
username='developer'
password='devops'

sudo mkdir /home/$username

sudo useradd -d /home/$username -s /bin/bash -p $(openssl passwd -1 $password) $username

sudo chmod 777 /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo echo "AllowUsers ubuntu $username" >> /etc/ssh/sshd_config
sudo chmod 644 /etc/ssh/sshd_config
sudo systemctl restart ssh

# Add users to Docker
usermod -aG docker ubuntu $username
systemctl restart docker

# Install and start the ELK stack
git clone https://github.com/deviantony/docker-elk.git
cd docker-elk
printf "\nlimits:\n  memory: 1500m" >> docker.compose.yml
docker-compose up -d
