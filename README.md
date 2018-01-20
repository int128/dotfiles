# dotfiles [![Build Status](https://travis-ci.org/int128/dotfiles.svg?branch=master)](https://travis-ci.org/int128/dotfiles)

Dot files of my environment.

## Install

Clone the repository into your home and run the installation script.

```zsh
git clone https://github.com/int128/dotfiles.git
dotfiles/install.sh
```

Environment specific configuration goes to `.zshrc.local`.

```zsh
echo enable_proxy >> .zshrc.local
```

### Platforms

See also platform specific installations:

- [macOS](macos)
- [Windows Subsystem for Linux (WSL)](wsl)
- [MSYS2](msys2) (deprecated)

### Languages

Additional setup:

```sh
# Workspace (~/repo)
ln -s /Volume/Data/repo

# GOPATH (~/go)
ln -s repo/go

# JRebel (~/repo/jrebel)
unzip -d repo jrebel-x.x.x-nosetup.zip
./repo/jrebel/bin/activate.sh 'LICENSE'
```

