# Install on WSL

This may work on both Ubuntu and Debian.

## Setup

```sh
# Bootstrap
sudo apt upgrade
sudo apt update
sudo apt install git vim

# Install
umask 022
git clone https://github.com/int128/dotfiles
./dotfiles/install.sh
./dotfiles/wsl/install.sh
```

## Additional installation

### VcXsrv

Install from https://sourceforge.net/projects/vcxsrv/.

### IDEA

Download from https://www.jetbrains.com/idea/download/#section=linux.

```sh
mkdir bin
cd bin
tar zxf ~/windows/Downloads/idea*.tar.gz
ln -s ../dotfiles/wsl/idea
```

Apply patch from https://github.com/int128/idea-fsnotifier-wsl.

```sh
cd bin/idea-*/bin
curl -LO https://github.com/int128/idea-fsnotifier-wsl/releases/download/1.1/fsnotifier64
```
