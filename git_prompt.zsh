# Enabling and setting git info var to be used in prompt config.
autoload -Uz vcs_info
# Enable substitution in the prompt.
setopt prompt_subst
zstyle ':vcs_info:*' enable git svn
# This line obtains information from the vcs.
zstyle ':vcs_info:git*' formats "- (%b%m) "
precmd() {
    vcs_info
}
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

# Config for the prompt. PS1 synonym.
prompt='%2/ ${vcs_info_msg_0_}%% '%
