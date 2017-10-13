#!/bin/bash -xe

sudo apt install x11-apps openjdk-8-jdk

if ! grep 'DISPLAY=' "$HOME/.zshrc.local"; then
  echo 'DISPLAY=:0.0' >> "$HOME/.zshrc.local"
fi

