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


### Bootstrap

```zsh
git clone https://github.com/Homebrew/homebrew.git .homebrew
exec zsh -l
brew doctor

brew install caskroom/cask/brew-cask
brew cask doctor
```


Install on Cygwin
-----------------

See [cygwin/README.md](cygwin/README.md).


Run on Docker
-------------

Build an image and run a container with dotfiles.

```zsh
docker build -t int128/dotfiles .
docker run -it --rm int128/dotfiles
```

