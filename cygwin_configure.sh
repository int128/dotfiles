#!/bin/bash -x

wget -O /usr/local/bin/apt-cyg https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg
chmod +x /usr/local/bin/apt-cyg 
apt-cyg --version

git config --global core.autocrlf input
git config --global credential.helper "$HOME/AppData/Roaming/GitCredStore/git-credential-winstore.exe"

