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

