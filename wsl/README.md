# Install on WSL

```sh
umask 022
git clone https://github.com/int128/dotfiles

./install.sh
./wsl/install.sh
```

## xterm

Install the following:

- [VcXsrv](https://sourceforge.net/projects/vcxsrv/)

Create a shortcut to open a xterm.

```
C:\Windows\System32\wsl.exe DISPLAY=:0 xterm -e zsh -l
```

