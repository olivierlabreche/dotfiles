
DOTFILES_DIRECTORY_NAME=$([ $SPIN ] && echo "dotfiles")

# Symlink core configs

# Link in the custom gitconfig.
ln -vsfn ~/$DOTFILES_DIRECTORY_NAME/.gitconfig ~/.gitconfig
