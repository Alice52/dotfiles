export ZSH="${HOME}/.oh-my-zsh"

# Theme.
ZSH_THEME="spaceship"
export SPACESHIP_DIR_TRUNC=0
export SPACESHIP_PROMPT_ASYNC=false

# Plugins.
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-z
    z
    timer
    sudo
    docker
    docker-compose
)

# ohmyzsh upgrate
# zstyle ':omz:update' mode auto

source $ZSH/oh-my-zsh.sh

######################### git config ###########################
# Use github/hub
# alias git=hub
# Go to project root
alias grt='cd "$(git rev-parse --show-toplevel)"'
alias gs='git status'
alias gp='git push'
alias gpf='git push --force'
alias gpft='git push --follow-tags'
alias gpl='git pull --rebase'
alias gcl='git clone'
alias gst='git stash'
alias grm='git rm'
alias gmv='git mv'
alias master='git checkout master'
alias main='git checkout main'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gb='git branch'
alias gbd='git branch -d'
alias gbav='git branch -av'
alias grb='git rebase'
alias grbom='git rebase origin/master'
alias grbc='git rebase --continue'
alias gl='git log'
alias glo='git log --oneline --graph'
alias grh='git reset HEAD'
alias grh1='git reset HEAD~1'
alias ga='git add'
alias gA='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit -a'
alias gcam='git add -A && git commit -m'
alias gfrb='git fetch origin && git rebase origin/master'
alias gxn='git clean -dn'
alias gx='git clean -df'
alias gsha='git rev-parse HEAD | pbcopy'
alias gsa='git submodule add '
alias gsi='git submodule init'
alias gsp='git submodule update --remote'
alias gsd='git submodule update --recursive'

alias ghci='gh run list -L 1'
######################### git config ###########################

# Set colors for LS_COLORS.
# eval $(dircolors ~/.dircolors)

# config profile
source /etc/profile
source $HOME/.zshrc_custom
