#!/bin/bash -xe

DOCKER_COMPOSE_VERSION=1.19.0

sudo apt install -y \
  lsb-release \
  curl \
  apt-transport-https \
  zsh \
  x11-apps \
  xterm \
  openjdk-8-jdk

sudo chsh -s /bin/zsh "$USER"

# Store Git credentials
git config --global credential.helper store

# Create symlink to Windows home
ln -snf "/mnt/c/Users/$USER" ~/windows

# Create symlink to Windows fonts
ln -sf /mnt/c/Windows/Fonts/Menlo-Regular.ttf ~/.fonts
ln -sf /mnt/c/Windows/Fonts/meiryo.ttc ~/.fonts
ln -sf /mnt/c/Windows/Fonts/meiryob.ttc ~/.fonts

# Environment specific settings
cat > "$HOME/.zshrc.local" <<EOF
# Use VcXsrv
export DISPLAY=:0.0
# Use Docker for Windows via TCP socket
export DOCKER_HOST=tcp://0.0.0.0:2375
EOF

# Visual Studio Code
# https://code.visualstudio.com/docs/setup/linux
if [ ! -f /usr/bin/code ]; then
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
  sudo apt-get update
  sudo apt-get install code # or code-insiders
fi
code --version

# Google Cloud
# https://cloud.google.com/sdk/docs/quickstart-debian-ubuntu
if [ ! -f /usr/bin/gcloud ]; then
  CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
  echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  sudo apt-get update && sudo apt-get install google-cloud-sdk
fi
gcloud version

# Docker Compose
if [ ! -f /usr/local/bin/docker-compose ]; then
  sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m`" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi
docker-compose --version
