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
export PATH="$HOME/.local/bin:$PATH"
export NODE_PATH="$HOME/npm/lib/node_modules:$NODE_PATH"

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

alias t=tig

[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
export _JAVA_AWT_WM_NONREPARENTING=1
export PYENV_ROOT=$(pyenv root)

source $HOME/.local_zshrc
