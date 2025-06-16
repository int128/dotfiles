# dotfiles [![build](https://github.com/int128/dotfiles/actions/workflows/build.yaml/badge.svg)](https://github.com/int128/dotfiles/actions/workflows/build.yaml)

This is a dotfiles of my environment.

## Getting Started

### Sandbox

To run a container:

```sh
docker run --rm -it ghcr.io/int128/dotfiles:main
```

To run an ephemeral pod:

```sh
k run --rm -it --image ghcr.io/int128/dotfiles:main int128-sandbox
```

### Local setup

```sh
git clone https://github.com/int128/dotfiles.git
./dotfiles/install
```

See also [macOS](macos) for the additional setup.

You can put environment specific configuration to `.zshrc.local`.
For example,

```zsh
echo enable_proxy >> .zshrc.local
```
