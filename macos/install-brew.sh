#!/bin/bash -x

cask_target=(
  # Desktop
  iterm2
  google-chrome

  # Development
  visual-studio-code
  goland

  # Infrastructure
  docker
)

brew install --cask ${cask_target[*]}

target=(
  # Development
  go
  node@16

  # Infrastructure
  awscli
  terraform
)

brew install ${target[*]}

