Install on MSYS2
================

Install [MSYS2](https://msys2.github.io).

Remap the home directory.

```sh
echo 'C:/Users /home ntfs override,noacl,binary,auto 0 0' >> /etc/fstab
```

Clone the repository and run the installation script.

```sh
pacman -Su
pacman -S git
git clone https://github.com/int128/dotfiles.git
dotfiles/msys2/install.sh
dotfiles/install.sh
```

Install additional packages.

* [Git Credential Manager](https://github.com/Microsoft/Git-Credential-Manager-for-Windows)
* [MeiryoKe font family](http://www.geocities.jp/meir000/meiryoKe/index.html)
* [Menlo](https://github.com/hbin/top-programming-fonts)

Apply additional configuration:

```sh
git config --global credential.github.com.httpProxy http://localhost:9090
```


ConEmu
------

Install packages.

* [ConEmu](https://conemu.github.io)
* [ConEmu Cygwin/MSYS connector](https://github.com/Maximus5/cygwin-connector)

Configure ConEmu task.

```bat
set MSYSTEM=MINGW64 & C:\msys64\usr\bin\conemu-msys2-64.exe /usr/bin/zsh --login -i
```

