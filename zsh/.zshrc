export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  pyenv
)

source $ZSH/oh-my-zsh.sh

function cmk() {
  mkdir -p $1 && cd $1
}

alias mkdir="echo 'Use cmk instead' && mkdir"

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"
alias gp="git push"
alias gd="git diff"
alias gm="git merge"
alias gpl="git pull"
alias co="git checkout"
alias st="git stash"
alias stp="git stash pop"

alias pa="pyenv activate"
alias pd="pyenv deactivate"

alias v=nvim
export EDITOR=nvim
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/npm/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export NODE_PATH="$HOME/npm/lib/node_modules:$NODE_PATH"

alias tmux="tmux -2"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^P" up-line-or-beginning-search # Up
bindkey "^N" down-line-or-beginning-search # Down

#alias fan="cd ~/projects/flex/PC && nvm use 10.16.0 && npm run serve:angular"
#alias fc="cd ~/projects/flex/PC && nvm use 10.16.0 && tsc -w -p tsconfig-serve.json"
#alias fs="cd ~/projects/flex/PC && nvm use 10.16.0 && pa flex && nodemon flex/*.js --exec 'electron . --serve'"

#alias can="cd ~/projects/ctep/PC && nvm use 10.16.0 && npm run serve:angular"
#alias cc="cd ~/projects/ctep/PC && nvm use 10.16.0 && tsc -w -p tsconfig-serve.json"
#alias cs="cd ~/projects/ctep/PC && nvm use 10.16.0 && pa ctep && nodemon ct_ep/*.js --exec 'electron . --serve'"
#
#alias upb="node ~/.scripts/inc-build-v.js && git add package.json electron-builder.json && git commit -m 'up build version'"

[[ -s /home/rmrf/.autojump/etc/profile.d/autojump.sh ]] && source /home/rmrf/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
