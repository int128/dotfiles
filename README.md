dotfiles
========

Dot files of my environment.

Install
-------

Clone the repository into your home and run the installation script.

```zsh
git clone https://github.com/int128/dotfiles.git
dotfiles/install.sh
```

Environment specific configuration goes to `.zshrc.local`.

```zsh
# Enable proxy
enable_proxy
```

See also OS specific installations:

* [OS X](osx)
* [Cygwin](cygwin)

Sandbox
-------

Run a container.

```zsh
docker run -it --rm int128/dotfiles
```

