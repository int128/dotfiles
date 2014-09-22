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


### vim

Run `.vim/install.sh` to install NeoBundle.


Cygwin specific
---------------

Install [Cygwin](https://www.cygwin.com) with following packages.

* openssh
* git
* wget
* zsh

Run following and restart Cygwin to mount Windows home.

```zsh
echo 'C:/Users /home ntfs override,binary,auto 0 0' >> /etc/fstab
```

Clone dotfiles repository and install it.

```zsh
./install.sh
```

Install following.

* [git-credential-winstore](http://gitcredentialstore.codeplex.com)

Configure.

```zsh
./cygwin_configure.sh
```

Additionally install following.

* [Menlo font](https://github.com/hbin/top-programming-fonts)
* [Migu font](http://sourceforge.jp/projects/mix-mplus-ipa/releases/)

