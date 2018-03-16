#!/bin/bash -xe

DOCKER_COMPOSE_VERSION=1.17.0

sudo apt install zsh x11-apps xterm openjdk-8-jdk fonts-mplus

# Store Git credentials
git config --global credential.helper store

# X server
if ! grep 'DISPLAY=' "$HOME/.zshrc.local"; then
  echo 'export DISPLAY=:0.0' >> "$HOME/.zshrc.local"
fi

# Use remote Docker on Windows
if ! grep 'DOCKER_HOST=' "$HOME/.zshrc.local"; then
  echo 'export DOCKER_HOST=tcp://0.0.0.0:2375' >> "$HOME/.zshrc.local"
fi

# Google Cloud
if [ ! -f /usr/bin/gcloud ]; then
  CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
  echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  sudo apt-get update && sudo apt-get install google-cloud-sdk
fi
gcloud components list

# Docker Compose
if [ ! -f /usr/local/bin/docker-compose ]; then
  sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m`" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi
docker-compose --version

# Fonts
if [ ! -d ~/.fonts ]; then
  git clone --depth=1 https://github.com/hbin/top-programming-fonts ~/.fonts
  fc-cache -f
fi

