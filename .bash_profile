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


# Enable the global proxy.
#
# enable_global_proxy 9090
# enable_global_proxy 9090 1.2.3.4
#
function enable_global_proxy () {
  local port="$1"
  local host="$2"
  [ -z "$host" ] && host='localhost'

  export http_proxy="http://$host:$port/"
  export https_proxy="$http_proxy"
  export GRADLE_OPTS="-Dhttp.proxyHost=$host -Dhttp.proxyPort=$port"
}

