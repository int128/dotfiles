#!/bin/bash -xe

DOCKER_COMPOSE_VERSION=1.19.0

sudo apt install -y \
  lsb-release \
  curl \
  apt-transport-https \
  zsh \
  x11-apps \
  # vscode requires libxss1
  libxss1 \
  xterm \
  vim-gnome \
  openjdk-8-jdk-headless

sudo chsh -s /bin/zsh "$USER"

# Store Git credentials
git config --global credential.helper store

# Create symlink to Windows home
ln -snf "/mnt/c/Users/$USER" ~/windows

# Symlink .Xdefaults
ln -sf dotfiles/.Xdefaults ~/.Xdefaults

# Copy Windows fonts
mkdir -p "$HOME/.fonts"
install_windows_font () {
  if [ ! -f "$HOME/.fonts/$1" ]; then
    cp -a "/mnt/c/Windows/Fonts/$1" "$HOME/.fonts"
  fi
}
install_windows_font Menlo-Regular.ttf
install_windows_font meiryo.ttc
install_windows_font meiryob.ttc

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
  sudo apt update
  sudo apt install -y code # or code-insiders
fi
code --version

# Google Cloud
# https://cloud.google.com/sdk/docs/quickstart-debian-ubuntu
if [ ! -f /usr/bin/gcloud ]; then
  CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
  echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  sudo apt update
  sudo apt install -y google-cloud-sdk
fi
gcloud version

# Docker Compose
if [ ! -f /usr/local/bin/docker-compose ]; then
  sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m`" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi
docker-compose --version
