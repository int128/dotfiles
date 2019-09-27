#!/bin/sh -xe

if [ ! -d "$HOME/.homebrew" ]; then
    # https://docs.brew.sh/Installation
    mkdir "$HOME/.homebrew" && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C "$HOME/.homebrew"
fi
