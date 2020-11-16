#!/bin/bash -x

cask_target=(
  # Desktop
  iterm2
  google-chrome
  evernote

  # Development
  visual-studio-code
  goland

  # Infrastructure
  docker
)

brew cask install ${cask_target[*]}

target=(
  # Development
  go
  golangci/tap/golangci-lint
  node
  yarn

  # Infrastructure
  awscli
  terraform
)

brew install ${target[*]}

