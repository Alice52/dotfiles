#!/bin/bash

sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo tee /etc/apt/sources.list <<-'EOF'
# add this code
  #添加阿里源
  deb http://mirrors.aliyun.com/ubuntu/ focal main universe multiverse restricted
  deb http://mirrors.aliyun.com/ubuntu/ focal-security main universe multiverse restricted
  deb http://mirrors.aliyun.com/ubuntu/ focal-updates main universe multiverse restricted
  deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main universe multiverse restricted
  deb http://mirrors.aliyun.com/ubuntu/ focal-backports main universe multiverse restricted
  deb-src http://mirrors.aliyun.com/ubuntu/ focal main universe multiverse restricted
  deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main universe multiverse restricted
  deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main universe multiverse restricted
  deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main universe multiverse restricted
  deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main universe multiverse restricted

  #添加清华源
  deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
  # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
  deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
  # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
  deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
  # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
  deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
  # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse multiverse
EOF

sudo apt-get update
sudo apt-get install -y gcc

sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common

# sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo add-apt-repository "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"


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
