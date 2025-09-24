# zmodload zsh/zprof
 
if [[ $OSTYPE =~ "^linux" ]]; then
  export EDITOR="helix"
else
  export EDITOR="hx"
fi

export TERM='ghostty'
export ZSH_SCRIPTS=$HOME/.config/zsh
export PAGER='less'

source $ZSH_SCRIPTS/settings.sh
source $ZSH_SCRIPTS/prompt.sh
source $ZSH_SCRIPTS/aliases.sh
source $ZSH_SCRIPTS/apps.sh
source $ZSH_SCRIPTS/secrets.sh
source $ZSH_SCRIPTS/keys.sh
source $ZSH_SCRIPTS/completion.sh

# zprof
