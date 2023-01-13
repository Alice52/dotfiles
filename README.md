## dotfiles

1. feature

   - install zsh
   - install docker
   - repo clone

2. usage flow

   - centos:7.6

     ```js
     1. **choose system, then reset root password**
     1. yum install git -y
     3. clone dotfiles
     4. execute ./centos/zsh-install.sh
     5. execute ./centos/docker-install.sh
     6. execte install.sh
     7. **`notice: please us root account`: reset root password, and use as root**
     ```

   - ubuntu:20.04

     ```js
     1. **choose system, then reset root password**
     1. sudo apt-get install git -y
     2. clone dotfiles
     3. execute ./ubuntu/zsh-install.sh
     4. execute ./ubuntu/docker-install.sh
     5. execte install.sh
     6. **`notice: please us root account`: reset root password, and use as root**
     ```

## zsh

0. 使用 ssh 连接时需要 fira code 字体的支持
1. install zsh: yum | apt-get

   ```shell
   # 1. 查看当前终端
   echo $SHELL
   # 2. 查看所有可用终端
   cat /etc/shells
   # 3. 安装终端
   yum -y install zsh
   echo $ZSH_VERSION
   # 4. 切换使用 zsh
   chsh -s $(which zsh)
   chsh -s /bin/zsh
   ```

2. [centos]version control and version >= 5.0.2

   ```shell
   sudo yum update -y
   sudo yum install -y git make ncurses-devel gcc autoconf man yodl
   git clone -b zsh-5.7.1 https://github.com/zsh-users/zsh.git /tmp/zsh
   cd /tmp/zsh
   ./Util/preconfig
   ./configure
   sudo make -j 20 install
   ```

3. install oh-my-zsh: `./install.sh`

   - oh-my-zsh: **this must need fira code support**
   - themes: prompt
   - plugins: zsh/git/auto-suggestion/high-light
   - custom directory colors
   - core

     ```shell
     # 1. install oh-my-zsh
     sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
     # 2. un-install
     uninstall_oh_my_zsh zsh
     ```

4. 切换

   ```shell
   exec bash
   exec zsh
   ```

5. 使用

   ```shell
   # 1. 相关环境变量需要配置在 .zshrc | .zshrc_custom
   # 2. source ~/.zshrc
   ```

6. plugins

   - git
   - zsh-autosuggestions
   - zsh-syntax-highlighting
   - zsh-z
   - z: z jump folder
   - timer
   - sudo: double esc
   - docker
   - docker-compose

## common

1. config git

   ```shell
   git config --global user.name 'Alice52'
   git config --global user.email 'zzhang_xz@163.com'
   ssh-keygen -t rsa -C 'zzhang_xz@163.com'
   ```

2. install or upgrade pip3

   ```shell
   pip[3] install --upgrade pip
   ```

3. install docker-compose

   ```shell
   pip[3] uninstall docker-compose
   ```

4. config python3 as default python

   ```shell
   # set python3 default
   update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
   update-alternatives --install /usr/bin/python python /usr/bin/python3.6 2

   # get list alternatives
   update-alternatives --list python
   # choose version
   update-alternatives --config python
   ```

---

## reference

1. [codespace's terminal](https://bea.stollnitz.com/blog/codespaces-terminal/)
