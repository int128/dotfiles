# Install on WSL

This may work on both Ubuntu and Debian.

## Setup

Bootstrap:

```sh
sudo apt upgrade
sudo apt update
sudo apt install git vim
```

Install:

```sh
umask 022
git clone https://github.com/int128/dotfiles
./dotfiles/install.sh
./dotfiles/wsl/install.sh
```

Change the default shell.

```sh
chsh -s /bin/zsh
```

## xterm

Install the following:

- [VcXsrv](https://sourceforge.net/projects/vcxsrv/)

Create a shortcut to open a xterm.

```
C:\Windows\System32\wsl.exe DISPLAY=:0 xterm -e zsh -l
```

