#!/bin/bash -xe

dotfiles_msys2_base="$(cd $(dirname "$0") && pwd)"
dotfiles_msys2_relative_from_home="${dotfiles_msys2_base/$HOME\/}"

test "`uname -o`" = "Msys"

# Check if home directory is remapped
test -f "$HOME/ntuser.dat"

# Install dotfiles
cp -av "$dotfiles_msys2_base/_vimrc" "$HOME/_vimrc"
cp -av "$dotfiles_msys2_base/_gvimrc" "$HOME/_gvimrc"

# Install packages
pacman -Su
pacman -S git vim zsh

# Enable git credential manager
git config --global credential.helper manager

