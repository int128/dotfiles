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


Install on Cygwin
-----------------

### Cygwin

Install [Cygwin](https://www.cygwin.com) with following packages.

* openssh
* git
* wget
* zsh

Run following and restart Cygwin to mount Windows home.

```zsh
echo 'C:/Users /home ntfs override,binary,auto 0 0' >> /etc/fstab
```

### Dotfiles

Clone dotfiles repository and install it.

```zsh
git clone https://github.com/int128/dotfiles.git
dotfiles/install.sh
```

Install VIM NeoBundle.

```zsh
.vim/install.sh
```

### Additional

Install following.

* [git-credential-winstore](http://gitcredentialstore.codeplex.com)
* [Menlo font](https://github.com/hbin/top-programming-fonts)
* [Migu-1m font](http://sourceforge.jp/projects/mix-mplus-ipa/releases/)

Configure.

```zsh
./cygwin_configure.sh
```

