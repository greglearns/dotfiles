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


smartresize() {
   mogrify -path $3 -filter Triangle -define filter:support=2 -thumbnail $2 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB $1
}

export PATH="$HOME/lib:$HOME/bin:/usr/local/bin:$PATH:$HOME/.cargo/bin"
export PATH="$HOME/.stack/programs/x86_64-osx/ghc-7.10.3/bin:$HOME/.local/bin:$PATH"
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# if [ -s "$HOME/.nvm/nvm.sh" ]; then
#   # export NVM_DIR="$HOME/.nvm"
#   nvm_cmds=(nvm node npm yarn vim)
#   for cmd in $nvm_cmds ; do
#     alias $cmd="unalias $nvm_cmds && unset nvm_cmds && . $NVM_DIR/nvm.sh && $cmd"
#   done
# fi

# if [ -n "${USE_NVM}" ]; then
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; # This loads nvm
#   # echo "configuring nvm"
#   nvm use >/dev/null 2>&1;
# fi

[ -f /usr/local/etc/bash_completion.d/cdargs-bash.sh ] && source /usr/local/etc/bash_completion.d/cdargs-bash.sh

# alias fan="echo && /Users/greg/.rbenv/versions/2.1.0/bin/istats all && echo && date && echo"
# alias istat="/Users/greg/.rbenv/versions/2.1.0/bin/istats"
alias changelog="conventional-changelog -p angular -i CHANGELOG.md -s -r 0"
alias dcc="docker-compose"
alias fzfp="fzf --preview 'cat {}'"
alias rm="nocorrect rm"
alias rm="nocorrect rm"
alias sshn="ssh -o 'StrictHostKeyChecking no' -o 'UserKnownHostsFile /dev/null'"
alias tim="date; timer"
alias tre="tree -a -nI '.git*|bundle|elm-stuff|node_modules|target|tmp|bower_components|output|deps|.cache|build|_build'"
alias fd=fdfind
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
unsetopt correct

# autoload -U zmv
# alias mmv='noglob zmv -W'

export HOST=${HOST:-$(hostname)}
export HOSTNAME=${HOST}
export LSCOLORS="Gxfxcxdxbxegedabagacad"

export KOPS_STATE_STORE=s3://clusters.dev.devplan.io
export AWS_PROFILE=cwwt
# export AWS_PROFILE=2020dev
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
  setopt PROMPT_SUBST ; PS1='%n %c\$ '
  # setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
  #PS1="\\! \\W: "
fi

# if [ -f ~/.bashrc ]; then . ~/.bashrc ; fi
# [ -f /usr/local/etc/bash_completion.d/cdargs-bash.sh ] && source /usr/local/etc/bash_completion.d/cdargs-bash.sh

# if [ -e /Users/greg/.n ix-profile/etc/profile.d/n ix.sh ]; then . /Users/greg/.n ix-profile/etc/profile.d/n ix.sh; fi # added by Nix installer

# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
# export FZF_DEFAULT_COMMAND='rg --hidden --follow --glob "!.git/*" -g "!target/*"'
export FZF_DEFAULT_COMMAND='fd --type f'

export CDPATH=.:~/cdf
setopt CHASE_LINKS
export FEEDACCESS=~/code/searchspring/feedaccess

# export LDFLAGS=-L/usr/local/opt/openssl/lib
# export CPPFLAGS=-I/usr/local/opt/openssl/include


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/greg/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/greg/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/greg/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/greg/google-cloud-sdk/completion.zsh.inc'; fi

# Ruby setup
#source /usr/local/opt/chruby/share/chruby/chruby.sh
#source /usr/local/opt/chruby/share/chruby/auto.sh

# Java setup
#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"

export PATH="/usr/local/opt/elasticsearch@5.6/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

# begin timer completion
# . <(timer --completion)
# end timer completion

# init rbenv so ruby commands work
# eval "$(rbenv init -)"

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
# chruby ruby-2.5.8
# nvm use 12.16.1

source /home/greg/.config/broot/launcher/bash/br
eval "$(zoxide init zsh)"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export DDLOG_HOME="/home/greg/code/ddlog-v0.30.0-20201027231514-linux/ddlog"
export PATH="$DDLOG_HOME/bin:$PATH"
