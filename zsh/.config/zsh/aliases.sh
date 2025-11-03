export CLICOLOR=1
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS="di=1;36:ln=1;35:so=1;33:pi=1;37:ex=1;31:bd=34;46:cd=34;47:su=30;41:sg=30;46:tw=30;43:ow=30;47"

alias ls="ls --color=auto"
alias l="ls -la"
alias ll="ls -lA"

if [[ $OSTYPE =~ "^linux" ]]; then
  alias v="helix"
else
  alias v="hx"
fi

alias gs="git status --short"
alias gl="git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an  %ar%C(auto)  %D%n%s%n'"
alias ga="git add"
alias gap="git add --patch"
alias gd="git diff --output-indicator-new=' ' --output-indicator-old=' '"
alias gds="git diff --staged"
alias gc="git commit"
alias co="git checkout"
alias gb="git branch"
alias gpl="git pull"
alias gp="git push"
alias gpo='git push origin "$(git symbolic-ref --short HEAD)"'
alias st='git stash'
alias stp='git stash pop'
alias t="tig"
alias j="z"
alias extract-here="$HOME/.config/scripts/extract-here.sh"
alias join-bc-patient="$HOME/.config/scripts/join-bc-patient.sh"

alias js="jj status"
alias jsq="jj squash"
alias jl="jj log"
alias jd="jj diff"
alias jdesc="jj describe"
alias jdes="jj describe"
alias jde="jj describe"
alias jc="jj commit"
alias jn="jj new"
alias jb="jj bookmark"
alias jf="jj git fetch"
alias jp="jj git push"
alias je="jj edit"
alias ja="jj abandon"
alias ju="jj undo"
alias jr="jj rebase"
