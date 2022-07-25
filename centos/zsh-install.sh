#!/bin/bash

sudo yum install -y git make ncurses-devel gcc autoconf man yodl
sudo mkdir -p /tmp/zsh
sudo git clone --depth 1 -b zsh-5.7.1 https://github.com/zsh-users/zsh.git /tmp/zsh
cd /tmp/zsh
sudo ./Util/preconfig
sudo ./configure
sudo make -j 20 install

sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
