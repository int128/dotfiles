#!/bin/sh -xe

[ ! -d "$HOME/.homebrew" ] && mkdir "$HOME/.homebrew" && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C "$HOME/.homebrew"

