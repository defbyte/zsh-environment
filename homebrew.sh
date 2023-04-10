#!/bin/sh

# Installs usual suspects
echo -e "Updating Homebrew and installing basics...\n"

brew update
brew install git node nvm pyenv ruby-install chruby

echo -e "...and, well, there it is.\n"
