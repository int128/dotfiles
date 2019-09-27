# dotfiles [![Build Status](https://travis-ci.org/int128/dotfiles.svg?branch=master)](https://travis-ci.org/int128/dotfiles)

This is a dotfiles of my environment.


## Getting Started

```zsh
# Clone the repository
git clone https://github.com/int128/dotfiles.git

# Run the installation script
./dotfiles/install.sh
```

It supports the following platforms:

- [macOS](macos)
- [Google Cloud Shell](cloudshell)
- [Windows Subsystem for Linux (WSL)](wsl)
- [MSYS2](msys2) (deprecated)

You can put environment specific configuration to `.zshrc.local`.
For example,

```zsh
echo enable_proxy >> .zshrc.local
```
