# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
 
# br
source $HOME/.config/broot/launcher/bash/br

# docker
fpath=($HOME/.docker/completions $fpath)

# fnm
# FNM_PATH="$HOME/.local/share/fnm"
# if [ -d "$FNM_PATH" ]; then
#   export PATH="$FNM_PATH:$PATH"
#   eval "`fnm env`"
# fi

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
 
# zoxide
eval "$(zoxide init zsh)"

# jj
source <(COMPLETE=zsh jj)

