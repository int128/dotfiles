#!/bin/zsh -xe

# Homebrew
git clone https://github.com/Homebrew/homebrew.git "$HOME/.homebrew"
. "$HOME/.zshrc"
brew doctor

# Cask
brew install caskroom/cask/brew-cask
brew cask doctor

