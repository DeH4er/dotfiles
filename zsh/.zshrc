# If you come from bash you might have to change your $PATH.


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  #pyenv
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

function rmd() {
  pandoc $1 | lynx -vikeys -stdin
}

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
export PATH="/usr/local/go/bin:$PATH"
export NODE_PATH="$HOME/npm/lib/node_modules:$NODE_PATH"

alias tmux="tmux -2"

#funtion c() {
#  sshpass -p raspberry ssh "pi@10.11.26.$1"
#}

#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
#export LYNX_CFG=~/.lynxrc
#export LYNX_LSS=$HOME/lynx.lss

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#alias fan="cd ~/projects/flex/PC && nvm use 10.16.0 && npm run serve:angular"
#alias fc="cd ~/projects/flex/PC && nvm use 10.16.0 && tsc -w -p tsconfig-serve.json"
#alias fs="cd ~/projects/flex/PC && nvm use 10.16.0 && pa flex && nodemon flex/*.js --exec 'electron . --serve'"

#alias can="cd ~/projects/ctep/PC && nvm use 10.16.0 && npm run serve:angular"
#alias cc="cd ~/projects/ctep/PC && nvm use 10.16.0 && tsc -w -p tsconfig-serve.json"
#alias cs="cd ~/projects/ctep/PC && nvm use 10.16.0 && pa ctep && nodemon ct_ep/*.js --exec 'electron . --serve'"
#
#alias upb="node ~/.scripts/inc-build-v.js && git add package.json electron-builder.json && git commit -m 'up build version'"

#[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
#autoload -U compinit && compinit -u
