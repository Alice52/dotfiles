#!/bin/bash

sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

cat /etc/yum.repos.d/docker-ce.repo

sudo yum install docker-ce

systemctl start docker

sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://wfjvo9ge.mirror.aliyuncs.com"]
}
EOF

sudo systemctl daemon-reload
sudo systemctl restart docker

sudo docker run -d --name dev-portainer -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v /root/portainer/data:/data portainer/portainer-ce:latest
