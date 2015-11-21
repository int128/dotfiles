#!/bin/sh -xe

# Git
git config --global user.name "`cd dotfiles && git log -1 --format=format:%an`"
git config --global user.email "`cd dotfiles && git log -1 --format=format:%ae`"
git config --global include.path "$HOME/dotfiles/.gitconfig"
git config --global core.autocrlf input

# Install dotfiles
ln -snfv dotfiles/.zshrc "$HOME/.zshrc"
ln -snfv dotfiles/.vimrc "$HOME/.vimrc"
ln -snfv dotfiles/.gvimrc "$HOME/.gvimrc"
ln -snfv dotfiles/.gemrc "$HOME/.gemrc"

# Create dotvim
mkdir -v -m 700 "$HOME/.vim"
mkdir -v -m 700 "$HOME/.vim/tmp"
mkdir -v -m 700 "$HOME/.vim/bundle"

# VIM
git clone https://github.com/Shougo/neobundle.vim "$HOME/.vim/bundle/neobundle.vim"
vim +NeoBundleInstall +qall

