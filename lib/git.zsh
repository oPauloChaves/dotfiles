# from: https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh
# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function git_current_branch() {
  local ref # branch name
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local exit_code=$?
  if [[ $exit_code != 0 ]]; then
    [[ $exit_code == 128 ]] && return # no git repo
    # git commit shorter unique name
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/} # remove prefix "refs/heads/"
}
