#!/bin/sh

echo -e "Installing Oh My Zsh and mounting envrionment...\n"

# Where are we?
project_dir=$(pwd)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Symlink my-zsh sources
ln -sf "$project_dir/zsh" "$HOME/.zsh"

# Do we need to create .nvm and .pyenv?
if [ ! -d "$HOME/.nvm" ]; then
    mkdir ~/.nvm
fi
if [ ! -d "$HOME/.pyenv" ]; then
    mkdir ~/.pyenv
fi

# Symlink dotfiles
ln -sf "$project_dir/dotfiles/gitconfig" "$HOME/.gitconfig"
ln -sf "$project_dir/dotfiles/gitignore" "$HOME/.gitignore"
ln -sf "$project_dir/dotfiles/zshrc" "$HOME/.zshrc"

echo -e "...complete\n"
