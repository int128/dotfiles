#!/bin/sh -xe

# Homebrew
[ ! -d "$HOME/.homebrew" ] && git clone --depth=1 https://github.com/Homebrew/homebrew.git "$HOME/.homebrew"

# iTerm color profile
curl -L -o ~/Desktop/SolarizedLight.itermcolors https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Light.itermcolors

