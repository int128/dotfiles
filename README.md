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

Install VIM NeoBundle.

```zsh
.vim/install.sh
```


### Environment specific

Put environment specific configurations into `.zshrc.local`:

```zsh
# Enable proxy
enable_proxy
```


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
* [Migu-1m font](http://sourceforge.jp/projects/mix-mplus-ipa/releases/)

