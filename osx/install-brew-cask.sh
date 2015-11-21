#!/bin/sh -xe

brew install caskroom/cask/brew-cask
brew tap caskroom/versions
brew cask doctor

brew cask update

brew cask install google-chrome
brew cask install mplayerx
brew cask install picasa
brew cask install evernote

brew cask install iterm2
brew cask install atom
brew cask install gitx
brew cask install macvim-kaoriya

brew cask install tunnelblick
brew cask install virtualbox

brew cask install java7
brew cask install intellij-idea
brew cask install android-studio

