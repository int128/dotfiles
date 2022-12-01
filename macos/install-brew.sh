#!/bin/bash -x

cask_target=(
  # Desktop
  google-chrome

  # Development
  visual-studio-code
  goland

  # Infrastructure
  session-manager-plugin
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

