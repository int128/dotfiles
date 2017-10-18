#!/bin/bash -xe

sudo apt install x11-apps openjdk-8-jdk

if ! grep 'DISPLAY=' "$HOME/.zshrc.local"; then
  echo 'DISPLAY=:0.0' >> "$HOME/.zshrc.local"
fi

if ! gcloud; then
  export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
  echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  sudo apt-get update && sudo apt-get install google-cloud-sdk
fi

