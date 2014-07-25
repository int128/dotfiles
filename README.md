dotfiles
========

Dot files of my environment.


Setting up
----------

### bash

Append following to your `.bashrc`

```bash
. ~/dotfiles/.bashrc
```

Append following to your `.bash_profile`

```bash
. ~/dotfiles/.bash_profile

# if needed
enable_global_proxy 9090
```


### others

Symlink dot files if needed.


Platform dependent issues
-------------------------

### Cygwin

* Apply `cygwin/fstab` in order to mount `c:/Users` to `/home`.
* Install [Menlo font](https://github.com/hbin/top-programming-fonts).
* Install [git-credential-winstore](http://gitcredentialstore.codeplex.com).
