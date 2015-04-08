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
echo 'C:/Users /home ntfs override,noacl,binary,auto 0 0' >> /etc/fstab
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

Install [git-credential-winstore](http://gitcredentialstore.codeplex.com) manually.

Generate [MeiryoKe font family](http://web1.nazca.co.jp/hp/nzkchicagob/m6x9801/mrktb4br6.html) manually.

Then, install additional packages.

```zsh
cygwin/install.sh
```

