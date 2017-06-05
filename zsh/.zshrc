#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# If I could disable Ctrl-s completely I would!
setopt NO_FLOW_CONTROL

# Customize to your needs...

# don't put duplicate lines or lines starting with space in the history.
# HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
# setopt INC_APPEND_HISTORY

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# HISTSIZE=1000
# HISTFILESIZE=2000



export PATH="$HOME/lib:$HOME/bin:/usr/local/bin:$PATH:$HOME/.cargo/bin"
export PATH="$HOME/.stack/programs/x86_64-osx/ghc-7.10.3/bin:$HOME/.local/bin:$PATH"

[ -f /usr/local/etc/bash_completion.d/cdargs-bash.sh ] && source /usr/local/etc/bash_completion.d/cdargs-bash.sh

alias tre="tree -nI '.git|bundle|elm-stuff|node_modules|target|tmp|bower_components|output|deps'"
# alias istat="/Users/greg/.rbenv/versions/2.1.0/bin/istats"
# alias fan="echo && /Users/greg/.rbenv/versions/2.1.0/bin/istats all && echo && date && echo"
alias dcc="docker-compose"
alias sshn="ssh -o 'StrictHostKeyChecking no' -o 'UserKnownHostsFile /dev/null'"

alias rm="nocorrect rm"
unsetopt correct

# autoload -U zmv
# alias mmv='noglob zmv -W'

export HOST=${HOST:-$(hostname)}
export HOSTNAME=${HOST}
export LSCOLORS="Gxfxcxdxbxegedabagacad"

export KOPS_STATE_STORE=s3://clusters.dev.devplan.io
export AWS_PROFILE=kubernetes
alias k=kubectl
# alias ka="kubectl --context=us-west-2.dev.devplan.io"
# alias ka="kubectl get po --all-namespaces"
# alias kd="kubectl -n deis"
alias ks="kubectl -n kube-system"

# ---  from bash_profile
EDITOR=/usr/bin/vim; export EDITOR

export GIT_PS1_SHOWDIRTYSTATE=on
export GIT_PS1_SHOWUPSTREAM="git"
# export GIT_PS1_SHOWUPSTREAM="git verbose"
# export GIT_PS1_SHOWSTASHSTATE=on
# export GIT_PS1_SHOWUNTRACKEDFILES=on

# [ -f ~/git-completion.bash ] && source ~/git-completion.bash
# [ -f ~/git-completion.zsh ] && source ~/git-completion.zsh

# Git prompt
[[ $- == *i* ]]   &&   . ~/.git-prompt.sh

# export PATH="$PATH:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/share/python"
# export NODE_PATH="/usr/local/lib/node_modules"

#######################################################################################
#  color chart:
#  Black       0;30     Dark Gray     1;30      Blue        0;34     Light Blue    1;34
#  Red         0;31     Light Red     1;31      Purple      0;35     Light Purple  1;35
#  Green       0;32     Light Green   1;32      Cyan        0;36     Light Cyan    1;36
#  Brown       0;33     Yellow        1;33      Light Gray  0;37     White         1;37
#  No color    0

#PS1="\w\$ "
# \h:\W \u\$
# If id command returns zero, you’ve root access.
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1="\\[$(tput setaf 1)\\]\\u@\\h:\\w #\\[$(tput sgr0)\\]"
else # normal
  # export PS1='\[\e[0;32m\]\W$(__git_ps1 "(%s)")\$\[\e[0m\] ' #green
  setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
  #PS1="\\! \\W: "
fi

# if [ -f ~/.bashrc ]; then . ~/.bashrc ; fi
# [ -f /usr/local/etc/bash_completion.d/cdargs-bash.sh ] && source /usr/local/etc/bash_completion.d/cdargs-bash.sh

if [ -e /Users/greg/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/greg/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer


