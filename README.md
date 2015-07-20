dotfiles
========

Dot files of my environment.

Install on OSX or Linux
-----------------------

Clone the repository into your home and run the installation script.

```zsh
git clone https://github.com/int128/dotfiles.git
dotfiles/install.sh
```

### Environment specific

Environment specific configuration goes to `.zshrc.local`.

```zsh
# Enable proxy
enable_proxy
```

### OSX specific

```zsh
dotfiles/osx/install.sh
```

Install on Cygwin
-----------------

See [cygwin/README.md](cygwin/README.md).

Create a sandbox
----------------

Build and run a container on Docker.

```zsh
docker build -t int128/dotfiles .
docker run -it --rm int128/dotfiles
```

