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

# Customize to your needs...
export PATH="$HOME/lib:/usr/local/bin:$PATH:$HOME/.cargo/bin"
export PATH="$HOME/.stack/programs/x86_64-osx/ghc-7.10.3/bin:$HOME/.local/bin:$PATH"
# eval "$(rbenv init -)"

[ -f /usr/local/etc/bash_completion.d/cdargs-bash.sh ] && source /usr/local/etc/bash_completion.d/cdargs-bash.sh

alias tre="tree -nI 'elm-stuff|node_modules|target|tmp|bower_components|output|deps'"
# alias rrn="rerun -c -b --pattern '**/*.{js,css,scss,sass,ejs,html,txt,ractive}' --"
# alias rrp="rerun -c -b -x --pattern '**/*.{txt,text,plan}' --"
# alias rrr="rerun -c -b -x --pattern '**/*.{js,css,scss,sass,ejs,html,txt,ractive}' "
# alias be="bundle exec"
# alias ap="ansible-playbook"
alias istat="/Users/greg/.rbenv/versions/2.1.0/bin/istats"
alias fan="echo && /Users/greg/.rbenv/versions/2.1.0/bin/istats all && echo && date && echo"
# alias watch="watchy -w . -i '/\.|build|node_modules|tmp/|log/|\.bundle|\.json$' -- "
# alias watchd="watchy -i '/\.|build|node_modules|tmp/|log/|\.bundle|\.json$' -w "
# alias oc="overcast"
# alias awsi="aws --profile ice"
alias dcc="docker-compose"
alias sshn="ssh -o 'StrictHostKeyChecking no' -o 'UserKnownHostsFile /dev/null'"

alias rm="nocorrect rm"

# export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

unsetopt correct

# autoload -U zmv
# alias mmv='noglob zmv -W'

# which boot2docker > /dev/null && $(boot2docker shellinit 2>/dev/null)
# which boot2docker > /dev/null && alias bd="boot2docker"
# which overcast > /dev/null && eval $(overcast aliases)
# which docker-machine > /dev/null && eval "$(docker-machine env default)"
export HOST=${HOST:-$(hostname)}
export HOSTNAME=${HOST}
# export ANDROID_HOME=/usr/local/opt/android-sdk
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export KOPS_STATE_STORE=s3://clusters.dev.devplan.io
export AWS_PROFILE=kubernetes
alias k=kubectl
# alias ka="kubectl --context=us-west-2.dev.devplan.io"
# alias ka="kubectl get po --all-namespaces"
alias kd="kubectl -n deis"
alias ks="kubectl -n kube-system"

