setopt prompt_subst
autoload -Uz add-zsh-hook

prompt_exit_status_() {
  if [ $? -ne 0 ]; then
    prompt_exit_status='%F{red}➜%f'
  else;
    prompt_exit_status='%F{green}➜%f'
  fi
}

prompt_vcs_branch_() {
  local jj_branch=$(jj log --ignore-working-copy -n 1 --no-graph --color never -r "coalesce(ancestors(present(@)) & bookmarks(), root())" -T 'bookmarks.join(" ")' 2> /dev/null)
  
  if [ -n "$jj_branch" ]; then
    prompt_vcs_branch=" %F{blue}jj:(%f%F{red}${jj_branch}%F{blue})%f"
  else;
    local ref=$(git symbolic-ref HEAD 2> /dev/null || git rev-parse --short HEAD 2> /dev/null)
    if [ -n "$ref" ]; then
      local git_branch="${ref#refs/heads/}"
      prompt_vcs_branch=" %F{blue}git:(%f%F{red}${git_branch}%F{blue})%f"
    else;
      prompt_vcs_branch=""
    fi
  fi
}

add-zsh-hook precmd prompt_exit_status_
add-zsh-hook precmd prompt_vcs_branch_

# PROMPT='%B%F{cyan}%1~%f${prompt_vcs_branch}%b'$'\n''${prompt_exit_status}  '
PROMPT='%B${prompt_exit_status}  %F{cyan}%1~%f${prompt_vcs_branch}%b '
