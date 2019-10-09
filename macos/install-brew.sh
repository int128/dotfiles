#!/bin/bash -x

cask_target=(
  # Desktop
  iterm2
  google-chrome
  mplayerx
  evernote
  slack

  # Development
  visual-studio-code
  atom
  intellij-idea
  goland
  java

  # Infrastructure
  docker
  google-cloud-sdk
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
  helmfile
  kops
)

brew install ${target[*]}

