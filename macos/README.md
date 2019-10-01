# Install on macOS

Install Xcode Command Line Tools first.

```sh
git clone https://github.com/int128/dotfiles

# Install base
./dotfiles/install.sh
```

Create a volume as `/Volumes/data`.

```sh
mkdir -p /Volumes/data/.homebrew
ln -s /Volumes/data/.homebrew

# Install macOS specific
./dotfiles/macos/install.sh

# Install Homebrew packages
./dotfiles/macos/install-brew.sh
```
