Install on Cygwin
-----------------

Install [Cygwin](https://www.cygwin.com) with git and aria2.

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

Install additional packages.

* [Git Credential Manager](https://github.com/Microsoft/Git-Credential-Manager-for-Windows)
* [MeiryoKe font family](http://www.geocities.jp/meir000/meiryoKe/index.html)
* [Menlo](https://github.com/hbin/top-programming-fonts)

