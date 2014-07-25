dotfiles
========

Dot files of my environment.


Setting up
----------

### bash

Append following to your `.bashrc`

```
. ~/dotfiles/.bashrc
```

Append following to your `.bash_profile`

```
. ~/dotfiles/.bash_profile

# if needed
enable_global_proxy 9090
```


### others

Symlink dot files if needed.


Platform dependent issues
-------------------------

### Cygwin

See `cygwin` folder.

* Mount `c:/Users` to `/home` for interoperability. Use fstab.


