#!/bin/bash

git clone --depth=1 https://gitee.com/github-mirror-zsh/ohmyzsh.git $HOME/.oh-my-zsh

# create .zshrc_custom
touch $HOME/.zshrc_custom

create_symlinks() {
    # Get the directory in which this script lives.
    script_dir=$(dirname "$(readlink -f "$0")")

    # Get a list of all files in this directory that start with a dot.
    files=$(find -maxdepth 1 -type f -name ".*")

    # Create a symbolic link to each file in the home directory.
    for file in $files; do
        name=$(basename $file)
        echo "Creating symlink to $name in home directory."
        rm -rf ~/$name
        ln -s $script_dir/$name ~/$name
    done
}

create_symlinks

## install font
## sudo apt-get install powerline fonts-powerline -y

# echo "Initializing conda for zsh."
# conda init zsh

echo "Setting up the Spaceship theme."
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
git clone https://gitee.com/github-mirror-zsh/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
git clone https://gitee.com/github-mirror-zsh/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://gitee.com/github-mirror-zsh/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting --depth=1
git clone https://gitee.com/github-mirror-zsh/zsh-z.git $ZSH_CUSTOM/plugins/zsh-z --depth=1

chsh -s $(which zsh)
chsh -s /bin/zsh

source .zshrc
