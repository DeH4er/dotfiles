setopt prompt_subst
autoload -Uz add-zsh-hook

prompt_exit_status_() {
  if [ $? -ne 0 ]; then
    prompt_arrow_='%F{red}➜%f'
  else;
    prompt_arrow_='%F{green}➜%f'
  fi
}

prompt_git_branch_() {
  local ref=$(git symbolic-ref HEAD 2> /dev/null)

  if [ -n "$ref" ]; then
    local branch="${ref#refs/heads/}"
    prompt_git_=" %F{blue}git:(%f%F{red}${branch}%F{blue})%f"
  else;
    prompt_git_=""
  fi
}

add-zsh-hook precmd prompt_exit_status_
add-zsh-hook precmd prompt_git_branch_

PROMPT='${prompt_arrow_}%B  %F{cyan}%1~%f${prompt_git_}%b '
