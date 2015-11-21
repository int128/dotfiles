#!/bin/zsh -xe

# Homebrew
git clone https://github.com/Homebrew/homebrew.git "$HOME/.homebrew"
. "$HOME/.zshrc"
brew doctor

# Cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
brew cask doctor

# iTerm color profile
curl -L -o ~/Desktop/SolarizedLight.itermcolors https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Light.itermcolors

