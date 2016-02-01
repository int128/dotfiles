#!/bin/bash -xe

dotfiles_cygwin_base="$(cd $(dirname "$0") && pwd)"
dotfiles_cygwin_relative_from_home="${dotfiles_cygwin_base/$HOME\/}"

test "`uname -o`" = "Cygwin"

# Check if home directory is remapped
test -f "$HOME/ntuser.dat"

# Install dotfiles
ln -snfv "$dotfiles_cygwin_relative_from_home/.minttyrc" "$HOME/.minttyrc"
cp -av "$dotfiles_cygwin_base/_vimrc" "$HOME/_vimrc"
cp -av "$dotfiles_cygwin_base/_gvimrc" "$HOME/_gvimrc"

# apt-cyg
aria2c -d /usr/local/bin https://raw.githubusercontent.com/tmshn/cyg-fast/master/cyg-fast
chmod +x /usr/local/bin/cyg-fast
echo 'http://ftp.iij.ad.jp/pub/cygwin' > /etc/setup/last-mirror
cyg-fast --version
cyg-fast install unzip openssh vim zsh curl

# Generate passwd to change the login shell
mkpasswd -l -c > /etc/passwd
sed -i -e "/^$(whoami):/s,/bin/bash,/bin/zsh," /etc/passwd

# Install git credential manager
gcm_base="/usr/local/gcm"
mkdir -p "$gcm_base"
curl -L -o "$gcm_base/gcm.zip" "https://github.com/Microsoft/Git-Credential-Manager-for-Windows/releases/download/v1.0.0/gcm-v1.0.0.zip"
unzip -d "$gcm_base" "$gcm_base/gcm.zip"
chmod +x "$gcm_base/git-credential-manager.exe"
git config --global credential.helper "$gcm_base/git-credential-manager.exe"

