#!/bin/sh -xe

brew tap caskroom/cask
brew tap caskroom/versions

brew cask update

brew cask install iterm2
brew cask install virtualbox
brew cask install docker

brew cask install google-chrome
brew cask install atok
brew cask install mplayerx
brew cask install gimp
brew cask install evernote
brew cask install slack

brew cask install visual-studio-code
brew cask install atom
brew cask install macvim-kaoriya
brew cask install java
brew cask install intellij-idea

