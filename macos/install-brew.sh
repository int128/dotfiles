#!/bin/bash -x

cask_target=(
  # Desktop
  iterm2
  google-chrome

  # Development
  visual-studio-code
  goland

  # Infrastructure
)

brew install --cask ${cask_target[*]}

target=(
  # Development
  gh
  go
  node@16

  # Infrastructure
  awscli
  terraform
)

brew install ${target[*]}

