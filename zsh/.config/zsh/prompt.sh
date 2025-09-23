setopt prompt_subst
autoload -Uz add-zsh-hook

prompt_exit_status_() {
  if [ $? -ne 0 ]; then
    prompt_exit_status='%F{red}➜%f'
  else;
    prompt_exit_status='%F{green}➜%f'
  fi
}

prompt_git_branch_() {
  local ref=$(git symbolic-ref HEAD 2> /dev/null || git rev-parse --short HEAD 2> /dev/null)

  if [ -n "$ref" ]; then
    local branch="${ref#refs/heads/}"
    prompt_git_branch=" %F{blue}git:(%f%F{red}${branch}%F{blue})%f"
  else;
    prompt_git_branch=""
  fi
}

add-zsh-hook precmd prompt_exit_status_
add-zsh-hook precmd prompt_git_branch_

PROMPT='%B${prompt_exit_status}  %F{cyan}%1~%f${prompt_git_branch}%b '
