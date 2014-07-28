# .zshrc

#
# Environment and aliases
#
export EDITOR=vim

alias ll='ls -la'

# tmux: attach or create session
function t () {
  tmux has-session 2> /dev/null && tmux attach || tmux
}

case "$(uname)" in
  Linux | CYGWIN*)
    alias ls='ls --color=auto'
    ;;

  Darwin)
    alias ls='ls -G'

    export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:'
    ;;
esac

#
# General settings
#

# Key bindings
bindkey -e

bindkey ";5C" forward-word
bindkey ";5D" backward-word

# History
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

# Completion
autoload -U compinit
compinit -u

setopt magic_equal_subst

zstyle ':completion:*:default' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Prompt
autoload vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats       '%F{white}-> %F{green}%b%f'
zstyle ':vcs_info:*' actionformats '%F{white}-> %F{green}%b%F{white}:%F{green}%a%f'

setopt prompt_subst
setopt transient_rprompt

function set_prompt () {
  local dir='%F{blue}%B%~%b%f'
  local now='%F{yellow}%T%f'
  local rc='%F{white}=> %(?,%F{white},%F{red})%?%f'
  if [[ -z "$SSH_CLIENT" ]]; then
    local host='%F{green}%n%F{white}(%F{green}%m%F{white})%f'
  else
    local host="%F{green}%n%F{white}(%F{green}%m %F{white}<- %B${${=SSH_CLIENT}[1]}%b%F{white})%f"
  fi
  PROMPT="$now $dir $host"$' $vcs_info_msg_0_\n%# '
  RPROMPT="$rc"
}
set_prompt


#
# Functions
#

# Enable ssh agent forwarding if socket exists
function setup_ssh_auth_sock () {
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


# Enable proxy settings if needed (call in ~/.zshrc.local)
function enable_proxy () {
  local port="$1"
  local host="$2"
  [ -z "$port" ] && port='9090'
  [ -z "$host" ] && host='127.0.0.1'

  export http_proxy="http://$host:$port/"
  export https_proxy="$http_proxy"
  export GRADLE_OPTS="-Dhttp.proxyHost=$host -Dhttp.proxyPort=$port"
}


#
# More
#

# Apply environment specific settings if exists
[ -f ~/.zshrc.local ] && . ~/.zshrc.local


# Set final return value to 0 (shown in prompt)
true
