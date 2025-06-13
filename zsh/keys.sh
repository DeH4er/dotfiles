# Enable Vi Mode
# bindkey -v
# bindkey -M viins 'jk' vi-cmd-mode
 
autoload -z up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

autoload -z edit-command-line
zle -N edit-command-line 
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

bindkey '^[[Z' reverse-menu-complete
