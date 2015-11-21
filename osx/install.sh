#!/bin/sh -xe

# Homebrew
git clone https://github.com/Homebrew/homebrew.git "$HOME/.homebrew"
. "$HOME/.zshrc"
brew doctor

# iTerm color profile
curl -L -o ~/Desktop/SolarizedLight.itermcolors https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Light.itermcolors

