Install on Cygwin
-----------------

Install [Cygwin](https://www.cygwin.com) with default packages, git and aria2.

Remap the home directory.

```sh
echo 'C:/Users /home ntfs override,noacl,binary,auto 0 0' >> /etc/fstab
```

Clone the repository and run the installation script.

```sh
git clone https://github.com/int128/dotfiles.git
dotfiles/cygwin/install.sh
dotfiles/install.sh
```

Install packages.

* [git-credential-winstore](http://gitcredentialstore.codeplex.com)
* [MeiryoKe font family](http://web1.nazca.co.jp/hp/nzkchicagob/m6x9801/mrktb4br6.html)
* [Menlo font](https://github.com/hbin/top-programming-fonts)

```sh
git config --global credential.helper "$HOME/AppData/Roaming/GitCredStore/git-credential-winstore.exe"
```

