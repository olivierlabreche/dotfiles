
DOTFILES_DIRECTORY_NAME=$([ $SPIN ] && echo "dotfiles")

# Symlink core configs

# Link custom dotfiles
ln -vsfn ~/$DOTFILES_DIRECTORY_NAME/.gitconfig ~/.gitconfig
ln -vsfn ~/$DOTFILES_DIRECTORY_NAME/.zshrc ~/.zshrc
