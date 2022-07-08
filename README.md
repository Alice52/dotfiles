# dotfiles

1. this repo is configurations for codespace about zsh config
2. zsh's setting:
   - change terminal in vscode setting: `powerline font`, size
   - config `Oh My Zsh`
   - zsh's spaceship theme config
   - custom directory colors
3. zsh's version must gt 5.2.x: `omz update just can updagrde to 5.0.2`

   ```shell
   sudo yum update -y
   sudo yum install -y git make ncurses-devel gcc autoconf man yodl
   git clone -b zsh-5.7.1 https://github.com/zsh-users/zsh.git /tmp/zsh
   cd /tmp/zsh
   ./Util/preconfig
   ./configure
   sudo make -j 20 install
   ```

# reference

1. [codespace's terminal](https://bea.stollnitz.com/blog/codespaces-terminal/)
