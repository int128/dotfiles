#!/bin/bash -xe

dotfiles_cygwin_base="$(cd $(dirname "$0") && pwd)"
dotfiles_cygwin_relative_from_home="${dotfiles_cygwin_base/$HOME\/}"

test "`uname -o`" = "Cygwin"

# Check if home directory is remapped
test -f "$HOME/ntuser.dat"

# Install dotfiles
ln -snfv "$dotfiles_cygwin_relative_from_home/.minttyrc" "$HOME/.minttyrc"
cp -av "$dotfiles_cygwin_relative_from_home/_vimrc" "$HOME/_vimrc"
cp -av "$dotfiles_cygwin_relative_from_home/_gvimrc" "$HOME/_gvimrc"

# apt-cyg
wget -O /usr/local/bin/apt-cyg https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg
chmod +x /usr/local/bin/apt-cyg 
apt-cyg --version

apt-cyg install unzip openssh vim zsh

