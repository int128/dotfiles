# .zshrc

#
# General settings
#

autoload -Uz add-zsh-hook

# Key bindings
bindkey -e

# ctrl+arrow
# - iterm
bindkey '^[[1;5A' history-beginning-search-backward
bindkey '^[[1;5B' history-beginning-search-forward
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
# - iterm-linux-tmux
bindkey '^[OA' history-beginning-search-backward
bindkey '^[OB' history-beginning-search-forward
bindkey '^[OD' backward-word
bindkey '^[OC' forward-word

# alt+arrow
# - iterm
# - iterm-linux-tmux
#bindkey '^[^[[A'
#bindkey '^[^[[B'
bindkey '^[^[[D' beginning-of-line
bindkey '^[^[[C' end-of-line

# pageup, pagedown
# - putty
bindkey "^[[5~" history-beginning-search-backward
bindkey "^[[6~" history-beginning-search-forward


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
emoji[ok]=$'\U2705'
emoji[error]=$'\U274C'
emoji[git]=$'\U1F500'
emoji[git_changed]=$'\U1F37A'
emoji[git_untracked]=$'\U1F363'
emoji[git_clean]=$'\U2728'
emoji[right_arrow]=$'\U2794'

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

    git_indicator=("${emoji[git]}  %{%F{blue}%}${git_info[branch]}%{%f%}")
    (( ${git_info[clean]}     )) && git_indicator+=("${emoji[git_clean]}")
    (( ${git_info[changed]}   )) && git_indicator+=("${emoji[git_changed]}  %{%F{yellow}%}${git_info[changed]} changed%{%f%}")
    (( ${git_info[untracked]} )) && git_indicator+=("${emoji[git_untracked]}  %{%F{red}%}${git_info[untracked]} untracked%{%f%}")
  }
  _vcs_git_indicator="${git_indicator}"
}

function _depth_and_contents_of_pwd () {
  echo -n "${(r:${#${(s./.)PWD}}::>:)} "
  $(whence ls) -m
}

add-zsh-hook precmd _vcs_git_indicator
add-zsh-hook chpwd _depth_and_contents_of_pwd

function {
  local dir='%{%F{blue}%B%}%~%{%b%f%}'
  local now='%{%F{yellow}%}%D{%b %e %a %R %Z}%{%f%}'
  local rc="%(?,${emoji[ok]} ,${emoji[error]}  %{%F{red}%}%?%{%f%})"
  local user='%{%F{green}%}%n%{%f%}'
  local host='%{%F{green}%}%m%{%f%}'
  [ "$SSH_CLIENT" ] && local via="${${=SSH_CLIENT}[1]} %{%B%}${emoji[right_arrow]}%{%b%} "
  local git='$_vcs_git_indicator'
  [ "$TERM_PROGRAM" ] && local terminal=$'\e]1;%1~\a'
  local mark=$'\n%# '
  PROMPT="$dir $user($via$host) $rc $git$terminal$mark"
  RPROMPT="$now"
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
  print -n "${1%% *}:${pwd##*/} (${HOST%%.*})"
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
  export HOMEBREW_CASK_OPTS="--caskroom=$HOME/.homebrew/caskroom --binarydir=$HOME/.homebrew/bin"
}

# Travis CI
[ -f ~/.travis/travis.sh ] && . ~/.travis/travis.sh

# Node.js
[ -f ~/.nvm/nvm.sh ] && . ~/.nvm/nvm.sh

# Ruby
[ -x ~/.rbenv/bin/rbenv ] && {
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
}

whence gem >/dev/null && {
  export GEM_HOME="$(ruby -rubygems -e 'puts Gem.user_dir')"
  export PATH="$GEM_HOME/bin:$PATH"
}

# PostgreSQL
[ -d ~/.pgdata ] && export PGDATA="$HOME/.pgdata"

# sdkman/GVM
[[ -s ~/.sdkman/bin/sdkman-init.sh ]] && . ~/.sdkman/bin/sdkman-init.sh

# Golang
[ -d ~/repo/go ] && export GOPATH=~/repo/go
[ -d /usr/local/go/bin ] && export PATH="/usr/local/go/bin:$PATH"


#
# Aliases and functions
#

case "$(uname)" in
  Linux | CYGWIN*)
    alias ls='ls --color=auto'
    ;;
  Darwin)
    alias ls='ls -G'
    ;;
esac

alias ll='ls -lah'

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

# Select docker machine
function enable_docker_machine () {
  local machine="$1"
  [ -z "$machine" ] && local machine="$(docker-machine ls -q)"
  eval "$(docker-machine env "$machine")"
}

# OS X Terminal App with sudo privileges
function sudo_term () {
  osascript -e 'do shell script "/Applications/Utilities/Terminal.app/Contents/MacOS/Terminal" with administrator privileges'
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

# PKI certificate (requires GNU certtool)
function certtool_generate_key () {
  local key_file="$1"
  certtool -p --bits 4096 --outfile "$key_file"
}

function certtool_generate_csr () {
  local key_file="$1"
  local template_file="$2"
  local csr_file="$3"
  certtool -q --hash SHA512 --load-privkey "$key_file" --template "$template_file" --outfile "$csr_file"
}

function certtool_sign_crt () {
  local ca_key="$1"
  local ca_crt="$2"
  local csr_file="$3"
  local crt_file="$4"
  certtool -c --hash SHA512 --load-ca-privkey "$ca_key" --load-ca-certificate "$ca_crt" --load-request "$csr_file" --outfile "$crt_file"
}

function certtool_generate_self_crt () {
  local key_file="$1"
  local template_file="$2"
  local crt_file="$3"
  certtool -s --hash SHA512 --load-privkey "$key_file" --template "$template_file" --outfile "$crt_file"
}

function certtool_generate_dh_patams () {
  local dh_file="$1"
  certtool --generate-dh-params --bits 4096 --outfile "$dh_file"
}

# VirtualBox
function virtualbox_list_vms () {
  VBoxManage list vms "$@"
}

function virtualbox_start_vm () {
  VBoxManage startvm "$@"
}

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
