zstyle ':vcs_info:git*+set-message:*' hooks git-aheadbehind
# Show remote ref name and number of commits ahead-of or behind
function +vi-git-aheadbehind() {
  local ahead behind
  local -a gitstatus

  behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l | sed 's/ //g')
  (( $behind )) && gitstatus+=(" ↓${behind}") # only display if non-zero

  ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l | sed 's/ //g')
  (( $ahead )) && gitstatus+=(" ↑${ahead}")

  hook_com[misc]=${(j::)gitstatus}
}
