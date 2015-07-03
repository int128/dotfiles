#!/bin/bash -xe

test "$(uname -o)" = "Cygwin"

# Install dotfiles
ln -snfv dotfiles/cygwin/.minttyrc "$HOME/.minttyrc"
cp -av dotfiles/cygwin/_vimrc "$HOME/_vimrc"
cp -av dotfiles/cygwin/_gvimrc "$HOME/_gvimrc"

cygwin_base="$(dirname $0)"
cd "$cygwin_base"

# git-credential-winstore
test -f "$HOME/AppData/Roaming/GitCredStore/git-credential-winstore.exe"
git config --global credential.helper "$HOME/AppData/Roaming/GitCredStore/git-credential-winstore.exe"

# apt-cyg
wget -O /usr/local/bin/apt-cyg https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg
chmod +x /usr/local/bin/apt-cyg 
apt-cyg --version

apt-cyg install unzip

# top-programming-fonts
git clone https://github.com/hbin/top-programming-fonts.git

