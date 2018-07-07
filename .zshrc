# .zshrc

#
# Bootstrap configuration
#

umask 022

[ -z "$LANG" ] && {
  export LANG="en_US.UTF-8"
  export LC_ALL="$LANG"
}

[ -z "$SHELL" ] && export SHELL=/bin/zsh

#
# General settings
#

autoload -Uz add-zsh-hook

# Key bindings
bindkey -e

# ctrl+arrow
# on iterm
# on WSL on ConEmu
bindkey '^[[1;5A' history-beginning-search-backward
bindkey '^[[1;5B' history-beginning-search-forward
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# alt+arrow
# on iterm
#bindkey '^[^[[A'
#bindkey '^[^[[B'
bindkey '^[^[[D' beginning-of-line
bindkey '^[^[[C' end-of-line
# on WSL/ConEmu
#bindkey '^[[1;3A' 
#bindkey '^[[1;3B' 
bindkey '^[[1;3D' beginning-of-line
bindkey '^[[1;3C' end-of-line


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
autoload -U compinit
compinit -u

setopt magic_equal_subst

zstyle ':completion:*:default' menu select
if [ "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
else
  zstyle ':completion:*' list-colors di=34 ln=35 ex=31
fi

# Prompt
setopt prompt_subst

typeset -A emoji
emoji[ok]=$'\U2728 '
emoji[error]=$'\U1F525 '
emoji[git_changed]=$'\U1F363 '
emoji[git_untracked]=$'\U1F525 '
emoji[git_clean]=$'\U2728 '
emoji[right_arrow]=$'\U2794 '
emoji[kube]=$'\U1F433 '

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

# System load indicator
function _sys_load_indicator () {
  _sys_load_indicator="%{%F{green}%}${$(uptime)##*: }%{%f%}"
}
whence uptime >/dev/null && add-zsh-hook precmd _sys_load_indicator

# Kubernetes context indicator
function _kube_context_indicator () {
  [ "$_kubectl" ] && {
    local current_context="$("$_kubectl" config current-context 2> /dev/null)"
    [ "$current_context" ] && {
      _kube_context_indicator="${emoji[kube]} %{%F{blue}%}$current_context%{%f%}"
    }
  }
}
add-zsh-hook precmd _kube_context_indicator

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
  RPROMPT="$up(\$_sys_load_indicator) $now$down"
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

[[ "$TERM" =~ "^xterm" ]] && {
  add-zsh-hook precmd _window_title_cmd
  add-zsh-hook preexec _window_title_exec
}


#
# Environment
#

export EDITOR=vim

# Per-user bin
[ -d ~/bin ] && {
  export PATH="$PATH:$HOME/bin"
}

# Homebrew
[ -x ~/.homebrew/bin/brew ] && {
  export PATH="$HOME/.homebrew/bin:$PATH"
  export LD_LIBRARY_PATH="/usr/lib:$HOME/.homebrew/lib"
}

# Ruby
whence gem >/dev/null && {
  export GEM_HOME="$(ruby -rubygems -e 'puts Gem.user_dir')"
  export PATH="$GEM_HOME/bin:$PATH"
}

# PostgreSQL
[ -d ~/.pgdata ] && export PGDATA="$HOME/.pgdata"

# Golang
[ -d ~/go ] && {
  export PATH="$PATH:$HOME/go/bin"
}
[ -d /usr/local/go/bin ] && {
  export PATH="$PATH:/usr/local/go/bin"
}

# MacVim
[ -d /Applications/MacVim.app/Contents/bin ] && export PATH="/Applications/MacVim.app/Contents/bin:$PATH"

# Google cloud
[ -d ~/.homebrew/caskroom/google-cloud-sdk/latest/google-cloud-sdk ] && {
  . ~/.homebrew/caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
  . ~/.homebrew/caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
}

# Kubernetes
function kubectl () {
  [ -z "$_kubectl" ] && {
    _kubectl="$(whence -p kubectl 2> /dev/null)"
    echo -n "\e[31m$0 completion zsh... \e[0m" > /dev/stderr
    source <("$_kubectl" completion zsh)
    echo > /dev/stderr
  }
  "$_kubectl" "$@"
}


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

# tmux: attach or create session
function t () {
  tmux has-session 2> /dev/null && tmux attach || tmux
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

# OS X Notification
function display_notification () {
  osascript -e 'on run argv
    display notification current date as text with title item 1 of argv
  end run' -- "$*"
}

function with_display_notification () {
  "$@"
  display_notification "($?)" "$@"
}

# Random string generator
function random_alphanum () {
  local length="$1"
  local count="$2"
  LANG=C tr -dc 'a-zA-Z0-9' < /dev/urandom | fold -w "${length:-16}" | head -n "${count:-3}"
}

function random_alphanumsym () {
  local length="$1"
  local count="$2"
  LANG=C tr -dc 'a-zA-Z0-9!#$%&()@/' < /dev/urandom | fold -w "${length:-16}" | head -n "${count:-3}"
}

# Build tools
function gradle_dependency () {
  local module="$1"
  find ~/.gradle/caches -name "${module}*.jar" ! -name '*-sources.jar' -type f
}


#
# More
#

# Apply environment specific settings if exists
[ -f ~/.zshrc.local ] && . ~/.zshrc.local

# Set final return value to 0 (shown in prompt)
true
