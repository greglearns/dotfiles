#!/bin/bash
set -euxo pipefail

# DO THESE FIRST
# git clone https://github.com/greglearns/dotfiles.git ~/dotfiles
# zsh / prezto: https://github.com/sorin-ionescu/prezto
# nix-env -qa whatever



if ! [ -x "$(command -v curl)" ]; then
	sudo apt update
	sudo apt install curl -y
fi

command -v curl >/dev/null 2>&1 || { echo "I require curl but it's not installed.  Aborting." >&2; exit 1; }

if ! [ -x "$(command -v nix-env)" ]; then
	curl https://nixos.org/nix/install | sh
	source ~/.nix-profile/etc/profile.d/nix.sh
fi

if ! [ -x "$(command -v ag)" ]; then
	# sudo apt install silversearcher-ag -y;
  nix-env -i silver-searcher
fi

# if ! [ -x "$(command -v cv)" ]; then
# 	sudo apt install cdargs -y;
# fi


if ! [ -x "$(command -v git)" ]; then
	# sudo apt install -y git
  nix-env -i git
fi

cd ~/dotfiles
if [ git remote -v | grep https ]; then
  echo "fixing up remote origin to ssh"
  git remote set-url origin git@github.com:greglearns/dotfiles.git
fi


if ! [ -x "$(command -v tree)" ]; then
	nix-env -i vim tmux entr stow tree
fi

if [ ! -d ~/dotfiles/original ]; then
	mkdir -p ~/dotfiles/original;
	# cp ~/.* ~/dotfiles/original/
	find ~ -maxdepth 1 -type f | grep '/\.' | xargs -I {} cp {} ~/dotfiles/original
fi

if [ ! -d ~/.zprezto ]; then
	command -v git >/dev/null 2>&1 || { echo "I require git but it's not installed.  Aborting." >&2; exit 1; }
  # sudo apt install -y zsh
  nix-env -i zsh
  echo "/home/greg/.nix-profile/bin/zsh" | sudo cat >> /etc/shells
  #chsh -s `which zsh`
  chsh -s ~/.nix-profile/bin/zsh
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi


if [ ! -d ~/.stow-complete ]; then
	command -v stow >/dev/null 2>&1 || { echo "I require stow but it's not installed.  Aborting." >&2; exit 1; }
	cd `dirname $0`
	stow ack git js tmux vim zsh prezto;
	touch ~/.stow-complete;
fi

if [ ! -d ~/.vim/bundle ]; then
	mkdir -p ~/.vim/bundle
  mkdir -p ~/.vim/backup
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +BundleInstall +qall
fi

if ! [ -x "$(command -v xsel)" ]; then
  nix-env -i xsel-unstable-2016-09-02
fi

if ! [ -x "$(command -v htop)" ]; then
  nix-env -i htop atop iotop iftop
fi

if [ ! -d ~/.ssh ]; then
  ssh-keygen -t rsa -b 4096 -C "greg@greglearns.com"
  xsel -b < ~/.ssh/id_rsa.pub
  chromium-browser https://github.com/settings/keys
  chromium-browser https://bitbucket.org/account/user/greglearns/ssh-keys/
fi

if groups | grep -v docker; then
  sudo groupadd docker
  sudo usermod -aG docker $USER
  # logout and back in to force reevaluation of group membership
fi


# npm install -g watchy
# which brew && brew install npm chromedriver
# which brew && brew install git reattach-to-user-namespace ctags npm

# install
# iterm2
# skype
# sizeup
# docker
# alfred
# screenhero

# which npm && npm install -g jshint
# sudo ln -s /usr/bin/node{js,}

# [sudo] npm install -g js-beautify


# sudo apt remove dell-super-key
# sudo apt install compizconfig-settings-manager
# rm -rf /usr/share/gconf/defaults/40_oem-superkey-workaround 
# sudo rm -rf /usr/share/gconf/defaults/40_oem-superkey-workaround
# reboot

# install workrave
# tree -a -I .git

# nix-env -i skype

# --- remap capslock to control
# edit /etc/default/keyboard
# set:  XKBOPTIONS="ctrl:nocaps"
