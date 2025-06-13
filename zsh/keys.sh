# Enable Vi Mode
# bindkey -v

autoload -z edit-command-line
zle -N edit-command-line 

bindkey -M viins 'jk' vi-cmd-mode
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
bindkey '^[[Z' reverse-menu-complete
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
