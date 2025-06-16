export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

alias l="ls -la"
alias ll="ls -lA"

alias v="hx"
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
