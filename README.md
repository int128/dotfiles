dotfiles
========

Dot files of my environment.


Setting up
----------

### zsh

Symlink `.zshrc` and create `.zshrc.local` if needed.

```zsh
# .zshrc.local
enable_proxy
```


### bash

Append following to your `.bash_profile` and `.bashrc`.

```bash
# .bash_profile
. ~/dotfiles/.bash_profile

# .bashrc
. ~/dotfiles/.bashrc
```


### others

Symlink dot files if needed.


Platform dependent issues
-------------------------

### Cygwin

* Apply `cygwin/fstab` in order to mount `c:/Users` to `/home`.
* Install [Menlo font](https://github.com/hbin/top-programming-fonts).
* Install [git-credential-winstore](http://gitcredentialstore.codeplex.com).
