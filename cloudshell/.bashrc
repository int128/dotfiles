if [ ! -f /usr/bin/zsh ]; then
  sudo apt install -y zsh
fi
if [ -f /usr/bin/zsh ]; then
  exec zsh -l
fi
