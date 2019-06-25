# .bashrc

if [ -f /etc/profile ]; then
  . /etc/profile
fi

case "$(uname)" in
  Linux | CYGWIN*)
    alias ls='ls --color=auto'
    ;;
  Darwin)
    alias ls='ls -G'
    ;;
esac

alias ll='ls -la'

export EDITOR=vim

PS1='\[\e[36m\]`__git_ps1` \[\e[1;34m\]\w\[\e[0m\] $ '

if [ -f "$HOME/.bashrc.local" ]; then
  . "$HOME/.bashrc.local"
fi

