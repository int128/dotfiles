#!/bin/bash -x

cask_target=(
  # Desktop
  google-chrome

  # Development
  visual-studio-code
  goland
)

brew install --cask ${cask_target[*]}

target=(
  # Development
  gh
  go
)

brew install ${target[*]}

