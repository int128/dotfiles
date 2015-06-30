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

PS1='\e[33m\t \d \e[1;34m\w \e[0;32m\u\e[0m(\e[32m\h\e[0m)\e[0m\n$ '

