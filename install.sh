#!/bin/zsh -xe

# Install dotfiles
ln -snfv dotfiles/.zshrc "$HOME/.zshrc"
ln -snfv dotfiles/.vimrc "$HOME/.vimrc"
ln -snfv dotfiles/.gvimrc "$HOME/.gvimrc"
ln -snfv dotfiles/.vim "$HOME/.vim"

# Fix permission for security
chmod -v 700 "$HOME/dotfiles/.vim/tmp"

# Git
git_author=("${(f)$(git log -1 --format=format:%an%n%ae)}")
git config --global user.name  "${git_author[1]}"
git config --global user.email "${git_author[2]}"
git config --global include.path "$HOME/dotfiles/.gitconfig"
git config --global core.autocrlf input

# VIM
git clone https://github.com/Shougo/neobundle.vim "$HOME/.vim/bundle/neobundle.vim"
vim +NeoBundleInstall +qall

