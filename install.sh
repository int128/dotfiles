#!/bin/bash

dotfiles="$(dirname $0)"
os="$(uname -o)"

function install_link () {
  local name="$1"
  local dotfile="$dotfiles/$name"
  local target="$HOME/$name"
  if [ -e "$dotfile" ]; then
    if [ ! -e "$target" ]; then
      ln -sv "$dotfile" "$target"
    elif [ -L "$target" ]; then
      echo "Info: already installed: $target"
    else
      echo "Warning: should be symlink but not: $target"
    fi
  else
    echo "Fatal: source does not exist: $dotfile"
  fi
}

function install_copy () {
  local name="$1"
  local dotfile="$dotfiles/$name"
  local target="$HOME/$name"
  if [ -e "$dotfile" ]; then
    if [ ! -e "$target" ]; then
      cp -av "$dotfile" "$target"
    elif [ -f "$target" ]; then
      echo "Info: already installed: $target"
    else
      echo "Warning: should be file but not: $target"
    fi
  else
    echo "Fatal: source does not exist: $dotfile"
  fi
}

install_link .zshrc
install_link .vim
install_link .vimrc
install_link .gvimrc

if [ "$os" == "Cygwin" ]; then
  install_link .minttyrc
  install_copy _vimrc
  install_copy _gvimrc
fi

