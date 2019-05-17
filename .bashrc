# .bashrc

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

PS1='\e[1;34m\w\e[0m$ '

