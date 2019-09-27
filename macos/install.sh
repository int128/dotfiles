#!/bin/sh -xe

homebrew_dir="$HOME/.homebrew"

if [ ! -d "$homebrew_dir" ]; then
    # https://docs.brew.sh/Installation
    mkdir "$homebrew_dir" && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C "$homebrew_dir"
fi

"$homebrew_dir/bin/brew" update
"$homebrew_dir/bin/brew" tap caskroom/cask
