# .zshrc

#
# Bootstrap configuration
#

umask 022

if [ -z "$LANG" ]; then
  export LANG="en_US.UTF-8"
  export LC_ALL="$LANG"
fi

if [ -z "$SHELL" ]; then
  export SHELL=/bin/zsh
fi

#
# General settings
#

autoload -Uz add-zsh-hook

# Key bindings
bindkey -e

# ctrl+arrow
# (iterm)
bindkey '^[[1;5A' history-beginning-search-backward
bindkey '^[[1;5B' history-beginning-search-forward
# (iterm, macOS terminal)
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# alt+arrow
# (iterm)
bindkey '^[^[[D' beginning-of-line
bindkey '^[^[[C' end-of-line
# (macOS terminal)
bindkey '^[b' beginning-of-line
bindkey '^[f' end-of-line


# History
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

setopt share_history
setopt inc_append_history

setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_reduce_blanks

# Completion
autoload bashcompinit
bashcompinit
autoload -U compinit
compinit -u

setopt magic_equal_subst

zstyle ':completion:*:default' menu select
if [ "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
else
  zstyle ':completion:*' list-colors di=34 ln=35 ex=31
fi

# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html
complete -C aws_completer aws

# Prompt
setopt prompt_subst

typeset -A emoji
emoji[ok]=$'\U2728 '
emoji[error]=$'\U1F525 '
emoji[git_changed]=$'\U1F363 '
emoji[git_untracked]=$'\U1F525 '
emoji[git_clean]=$'\U2728 '
emoji[right_arrow]=$'\U2794 '
emoji[kube]=$'\U1F4E6 '

# Git indicator
function _vcs_git_indicator () {
  typeset -A git_info
  local git_indicator git_status
  git_status=("${(f)$(git status --porcelain --branch 2> /dev/null)}")
  (( $? == 0 )) && {
    git_info[branch]="${${git_status[1]}#\#\# }"
    shift git_status
    git_info[changed]=${#git_status:#\?\?*}
    git_info[untracked]=$(( $#git_status - ${git_info[changed]} ))
    git_info[clean]=$(( $#git_status == 0 ))
    git_indicator="%{%F{blue}%}${git_info[branch]} %{%f%}"
    if (( ${git_info[clean]} )); then
      git_indicator+="${emoji[git_clean]} "
    else
      git_indicator+="${emoji[git_changed]} "
      (( ${git_info[untracked]} )) && git_indicator+="%{%F{red}%}${git_info[untracked]}*%{%f%}"
      (( ${git_info[changed]}   )) && git_indicator+="%{%F{yellow}%}${git_info[changed]}%{%f%}"
    fi
  }
  _vcs_git_indicator="$git_indicator"
}
whence git >/dev/null && add-zsh-hook precmd _vcs_git_indicator

# Kubernetes context indicator
function _kube_context_indicator () {
  # this will be set up in kubectl function (see below)
}
add-zsh-hook precmd _kube_context_indicator

# Last command indicator
function _last_command_indicator () {
  _last_command_indicator="%{%F{cyan}%}$(date +%H:%M:%S) ${1:0:15}...%{%f%}"
}
add-zsh-hook preexec _last_command_indicator

function {
  local dir='%{%F{blue}%B%}%~%{%b%f%}'
  local now='%{%F{yellow}%}%*%{%f%}'
  local rc="%(?,${emoji[ok]},${emoji[error]} %{%F{red}%}%?%{%f%})"
  local user='%{%F{blue}%}%n%{%f%}'
  local host='%{%F{blue}%}%m%{%f%}'
  [ "$SSH_CLIENT" ] && local via="${${=SSH_CLIENT}[1]} %{%B%}${emoji[right_arrow]} %{%b%} "
  [ "$TERM_PROGRAM" ] && local terminal=$'\e]1;%1~\a'
  local mark=$'\n%# '
  local up=$'%{\e[A%}'
  local down=$'%{\e[B%}'
  PROMPT="$dir $user($via$host) $rc \$_vcs_git_indicator \$_kube_context_indicator$terminal$mark"
  RPROMPT="$up \$_last_command_indicator $now$down"
}

function _window_title_cmd () {
  local pwd="${PWD/~HOME/~}"
  print -n "\e]0;"
  print -n "${pwd##*/} (${HOST%%.*})"
  print -n "\a"
}

function _window_title_exec () {
  local pwd="${PWD/~HOME/~}"
  print -n "\e]0;"
  print -n "${1%% *} (${pwd##*/}) (${HOST%%.*})"
  print -n "\a"
}

if [[ "$TERM" =~ "^xterm" ]]; then
  add-zsh-hook precmd _window_title_cmd
  add-zsh-hook preexec _window_title_exec
fi


#
# Environment
#

export EDITOR=vim

# Per-user bin
if [ -d "$HOME/bin" ]; then
  export PATH="$PATH:$HOME/bin"
fi

# Homebrew
if [ -d /opt/homebrew/bin ]; then
  export PATH="$PATH:/opt/homebrew/bin"
fi

# Go
if [ -d "$HOME/go/bin" ]; then
  export PATH="$PATH:$HOME/go/bin"
fi

# krew
if [ -d "${KREW_ROOT:-$HOME/.krew}/bin" ]; then
  export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi

# aqua
if [ -d "$HOME/.local/share/aquaproj-aqua/bin" ]; then
  export PATH="$PATH:$HOME/.local/share/aquaproj-aqua/bin"
fi


#
# Aliases and functions
#

case "$(uname)" in
  Linux | CYGWIN* | MINGW*)
    alias ls='ls --color=auto'
    ;;
  Darwin)
    alias ls='ls -G'
    ;;
esac

alias ll='ls -lah'
alias lt='ll -tr'
alias k=kubectl
alias kctx='k config use-context'
alias ghco='gh pr checkout'
alias asl='aws sso login'

function ghpc () {
  gh pr create -fd "$@"
  gh pr view -w
}

# Enter demo style, e.g. taking a screenshot or live coding
function demo_style () {
  PROMPT="%{%F{blue}%B%}${emoji[right_arrow]}%{%b%f%} "
  unset RPROMPT
  add-zsh-hook -d precmd _window_title_cmd
  add-zsh-hook -d preexec _window_title_exec
  print -n "\e]0;terminal\a"
}

# Lazy-load kubectl completion
function kubectl () {
  local real_kubectl="$(whence -p kubectl 2> /dev/null)"
  if [ "$real_kubectl" ]; then
    echo -n "\e[31m$0 completion zsh... \e[0m" > /dev/stderr
    source <("$real_kubectl" completion zsh)
    echo > /dev/stderr
  fi
  unfunction kubectl

  # Set up the context indicator
  function _kube_context_indicator () {
    local current_context="$(kubectl config current-context 2> /dev/null)"
    if [ "$current_context" ]; then
      _kube_context_indicator="${emoji[kube]} %{%F{blue}%}$current_context%{%f%}"
    else
      _kube_context_indicator=""
    fi
  }

  kubectl "$@"
}

# Enable proxy settings (call in ~/.zshrc.local)
function enable_proxy () {
  local port="$1"
  local host="$2"
  [ -z "$port" ] && port='9090'
  [ -z "$host" ] && host='127.0.0.1'

  export http_proxy="http://$host:$port/"
  export https_proxy="$http_proxy"
  export JAVA_OPTS="-Dhttp.proxyHost=$host -Dhttp.proxyPort=$port -Dhttps.proxyHost=$host -Dhttps.proxyPort=$port"
}

# Prefix for command without proxy
function without_proxy () {
  http_proxy= https_proxy= "$@"
}


#
# More
#

# Apply environment specific settings if exists
if [ -f ~/.zshrc.local ]; then
  . ~/.zshrc.local
fi

# Set final return value to 0 (shown in prompt)
true
