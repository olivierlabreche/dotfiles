DOTFILES_DIRECTORY_NAME=$([ $SPIN ] && echo "dotfiles")

source ~/$DOTFILES_DIRECTORY_NAME/git_prompt.zsh # add push/pull counts to git prompt
source /etc/zsh/zshrc.default.inc.zsh


