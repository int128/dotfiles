dotfiles
========

Dot files of my environment.


Install
-------

Clone the repository into your home and run the installation script.

```zsh
./install.sh
```


### zsh

Create `.zshrc.local` if needed.

```zsh
# .zshrc.local
enable_proxy
```


Platform dependent issues
-------------------------

### Cygwin

* Apply `cygwin/fstab` in order to mount `c:/Users` to `/home`.
* Install [Menlo font](https://github.com/hbin/top-programming-fonts).
* Install [git-credential-winstore](http://gitcredentialstore.codeplex.com).


### Windows

* Copy `_vimrc` and `_gvimrc` to your home.
* Install [Migu font](http://mix-mplus-ipa.sourceforge.jp/migu/).

