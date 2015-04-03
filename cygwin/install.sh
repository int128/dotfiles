#!/bin/bash -xe

cygwin_base="$(dirname $0)"
cd "$cygwin_base"

# git-credential-winstore
test -f "$HOME/AppData/Roaming/GitCredStore/git-credential-winstore.exe"
git config --global core.autocrlf input
git config --global credential.helper "$HOME/AppData/Roaming/GitCredStore/git-credential-winstore.exe"

# apt-cyg
wget -O /usr/local/bin/apt-cyg https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg
chmod +x /usr/local/bin/apt-cyg 
apt-cyg --version

apt-cyg install unzip

# top-programming-fonts
git clone https://github.com/hbin/top-programming-fonts.git

# migu-1m
curl -LO "http://sourceforge.jp/projects/mix-mplus-ipa/downloads/59022/migu-1m-20130617.zip"
unzip migu-1m-20130617.zip

