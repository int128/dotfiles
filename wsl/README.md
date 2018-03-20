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

Create `.zsh.local`:

```sh
# Use VcXsrv
export DISPLAY=:0.0

# Use Docker for Windows via TCP socket
export DOCKER_HOST=tcp://0.0.0.0:2375

# Tell the default shell to xterm
export SHELL=/bin/zsh
```

Configure:

```sh
# Change the default shell
chsh -s /bin/zsh

# Symlink to Windows user folder
ln -s /mnt/c/Users/$USERNAME windows
```

## Additional installation

### Using git from Windows

Download [wslgit](https://github.com/andy-5/wslgit) and save it into `%USERPROFILE%\AppData\Local\Programs\Git\cmd\git.exe`.
Then add it to `PATH`.

### X

Install [VcXsrv](https://sourceforge.net/projects/vcxsrv/).

Create a shortcut to open a xterm.

```
C:\Windows\System32\wsl.exe DISPLAY=:0 xterm -e zsh -l
```

### IDEA

Download [IDEA](https://www.jetbrains.com/idea/download/#section=linux) and install it.

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
