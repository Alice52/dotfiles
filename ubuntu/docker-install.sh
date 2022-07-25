#!/bin/bash

sudo apt-get -y update
sudo apt-get -y install docker-ce

sudo systemctl enable docker

sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://wfjvo9ge.mirror.aliyuncs.com"]
}
EOF

sudo systemctl daemon-reload
sudo systemctl restart docker

sudo docker run -d --name dev-portainer -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v /root/portainer/data:/data portainer/portainer-ce:latest
sudo  docker update --restart=always dev-portainer
