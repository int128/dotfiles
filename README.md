# dotfiles [![Build Status](https://travis-ci.org/int128/dotfiles.svg?branch=master)](https://travis-ci.org/int128/dotfiles)

This is a dotfiles of my environment.


## Getting Started

```sh
# Clone the repository
git clone https://github.com/int128/dotfiles.git

# Run the installation script
./dotfiles/install
```

It supports the following platforms:

- [macOS](macos)
- [Google Cloud Shell](cloudshell)
- [Windows Subsystem for Linux (WSL)](wsl)

You need to set up the credentials.

- GitHub: https://github.com/settings/tokens
- Google Cloud: `gcloud auth login`
- AWS: `aws configure`
- `.gnupg`

You can put environment specific configuration to `.zshrc.local`.
For example,

```zsh
echo enable_proxy >> .zshrc.local
```
