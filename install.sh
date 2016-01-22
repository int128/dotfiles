#!/bin/bash -xe

dotfiles_base="$(cd $(dirname "$0") && pwd)"
dotfiles_relative_from_home="${dotfiles_base/$HOME\/}"

# Git
git config --global user.name "$(cd "$dotfiles_base" && git log -1 --format=format:%an)"
git config --global user.email "$(cd "$dotfiles_base" && git log -1 --format=format:%ae)"
git config --global include.path "$dotfiles_base/.gitconfig"
git config --global core.autocrlf input

# Install dotfiles
ln -snfv "$dotfiles_relative_from_home/.zshrc" "$HOME/.zshrc"
ln -snfv "$dotfiles_relative_from_home/.vimrc" "$HOME/.vimrc"
ln -snfv "$dotfiles_relative_from_home/.gvimrc" "$HOME/.gvimrc"
ln -snfv "$dotfiles_relative_from_home/.gemrc" "$HOME/.gemrc"

# Create dotvim
mkdir -p -v "$HOME/.vim"
mkdir -p -v "$HOME/.vim/tmp"
mkdir -p -v "$HOME/.vim/bundle"
chmod 700 "$HOME/.vim" || true

# VIM
git clone https://github.com/Shougo/neobundle.vim "$HOME/.vim/bundle/neobundle.vim"
"$HOME/.vim/bundle/neobundle.vim/bin/neoinstall"

