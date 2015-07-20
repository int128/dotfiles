Install on Cygwin
-----------------

Install following packages.

* [git-credential-winstore](http://gitcredentialstore.codeplex.com)
* [MeiryoKe font family](http://web1.nazca.co.jp/hp/nzkchicagob/m6x9801/mrktb4br6.html)
* [Menlo font](https://github.com/hbin/top-programming-fonts)

Install [Cygwin](https://www.cygwin.com) with following packages.

* git
* wget

Run following and restart Cygwin to mount Windows home.

```sh
echo 'C:/Users /home ntfs override,noacl,binary,auto 0 0' >> /etc/fstab
```

Clone the repository into your home and run the installation script.

```sh
git clone https://github.com/int128/dotfiles.git
dotfiles/cygwin/install.sh
dotfiles/install.sh
```

