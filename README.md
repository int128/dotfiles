dotfiles [![Build Status](https://travis-ci.org/int128/dotfiles.svg?branch=master)](https://travis-ci.org/int128/dotfiles)
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
echo enable_proxy >> .zshrc.local
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

