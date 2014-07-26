# .bash_profile

case "$(uname)" in
  CYGWIN*)
    export LANG=ja_JP.UTF-8
    export LC_ALL=$LANG
    ;;

  Darwin)
    ;;
esac

export EDITOR=vim
PS1='\e[32m\u@\h \e[34m\w \e[33m[\t \d]\e[00m\n$ '


# Enable ssh agent forwarding if socket exists.
setup_ssh_auth_sock () {
  local agent="$1"
  if [ -S "$agent" ]; then
    export SSH_AUTH_SOCK="$agent"
  elif [ ! -S "$SSH_AUTH_SOCK" ]; then
    export SSH_AUTH_SOCK="$agent"
  elif [ ! -L "$SSH_AUTH_SOCK" ]; then
    ln -snf "$SSH_AUTH_SOCK" "$agent" && export SSH_AUTH_SOCK="$agent"
  fi
}
setup_ssh_auth_sock "$HOME/.ssh/.agent-$(hostname)"


# Enable the global proxy.
#
# enable_global_proxy 9090
# enable_global_proxy 9090 1.2.3.4
#
function enable_global_proxy () {
  local port="$1"
  local host="$2"
  [ -z "$host" ] && host='127.0.0.1'

  export http_proxy="http://$host:$port/"
  export https_proxy="$http_proxy"
  export GRADLE_OPTS="-Dhttp.proxyHost=$host -Dhttp.proxyPort=$port"
}

