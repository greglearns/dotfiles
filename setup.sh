#!/bin/bash
set -euxo pipefail

# DO THESE FIRST
# log in to github and bitbucket
# download and unzip https://github.com/greglearns/dotfiles.git somewhere other than ~/dotfiles
# cd <dir>; ./setup.sh

LALA=$(sudo dmidecode | grep Dell > /dev/null)
ISDELL=$?

if ! [ -x "$(command -v curl)" ]; then
  sudo apt update
  sudo apt install curl -y
fi

command -v curl >/dev/null 2>&1 || { echo "I require curl but it's not installed.  Aborting." >&2; exit 1; }

if [ ! -d ~/.nix-profile ]; then
  curl https://nixos.org/nix/install | sh
fi

if ! [ -x "$(command -v nix-env)" ]; then
  source ~/.nix-profile/etc/profile.d/nix.sh
fi

if ! [ -x "$(command -v git)" ]; then
  # sudo apt install -y git
  nix-env -i git
fi

if ! [ -x "$(command -v xsel)" ]; then
  nix-env -i xsel-unstable-2016-09-02
fi

if [ ! -d ~/.ssh ]; then
  read -p "Enter your email address for the SSH key: " email
  ssh-keygen -t rsa -b 4096 -C $email
  # ssh-keygen -t rsa -b 4096 -C "greg@greglearns.com"
  xsel -b < ~/.ssh/id_rsa.pub
  chromium-browser https://github.com/settings/keys
  chromium-browser https://bitbucket.org/account/user/greglearns/ssh-keys/
  read -p "Press [Enter] after SSH key is installed in Github and BitBucket."
fi

if [ ! -d ~/dotfiles ]; then
  git clone git@github.com:greglearns/dotfiles.git ~/dotfiles
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
  echo "${HOME}/.nix-profile/bin/zsh" | sudo tee -a /etc/shells
  #chsh -s `which zsh`
  chsh -s "${HOME}/.nix-profile/bin/zsh"
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi


if [ ! -f ~/.stow-complete ]; then
  command -v stow >/dev/null 2>&1 || { echo "I require stow but it's not installed.  Aborting." >&2; exit 1; }
  cd `dirname $0`
  stow ack git js tmux vim zsh prezto;
  touch ~/.stow-complete;
fi

if [ ! -d ~/bin ]; then
  ln -s ~/dotfiles/bin ~/bin
fi

if ! [ -x "$(command -v ag)" ]; then
  # sudo apt install silversearcher-ag -y;
  nix-env -i silver-searcher
fi

if [ ! -d ~/.vim/bundle ]; then
  mkdir -p ~/.vim/bundle
  mkdir -p ~/.vim/backup
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +BundleInstall +qall
fi

if ! [ -x "$(command -v htop)" ]; then
  nix-env -i htop atop iotop iftop
fi

if ! [ -x "$(command -v xdotool)" ]; then
  nix-env -i xdotool
fi

if ! [ -x "$(command -v docker)" ]; then
  sudo groupadd docker || true
  sudo usermod -aG docker $USER
  # logout and back in to force reevaluation of group membership
  nix-env -i docker-17.05.0-ce
  nix-env -i docker-compose-1.13.0
  # sudo /home/greg/.nix-profile/bin/dockerd
fi

if ! [ -x "$(command -v postgres)" ]; then
  nix-env -i postgresql-9.6.2
  echo "host    all             all             0.0.0.0/0            trust" | tee -a ~/tmp/pgdata/pg_hba.conf
  echo "listen_addresses = '0.0.0.0'" | tee -a ~/tmp/pgdata/postgresql.conf
  # https://www.johbo.com/2017/on-demand-postgresql-for-your-development-environment.html
  # nix-shell -p postgresql
  # export PGDATA=~/tmp/pgdata
  # initdb -A trust
  # pg_ctl start  # OR /home/greg/.nix-profile/bin/pg_ctl -D /home/greg/tmp/pgdata -l logfile start
  # createdb myproject
fi

if ! [ -x "$(command -v elm-make)" ]; then
  nix-env -i elm-0.18.0
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


if [[ $ISDELL ]] && [ ! -f /etc/X11/xorg.conf ]; then
  sudo cp ~/dotfiles/etc/X11/xorg.conf /etc/X11/xorg.conf
fi

if dpkg -s dell-super-key; then
  # https://www.dell.com/support/article/us/en/19/HOW12108/how-to-enable-the-ubuntu-super-key-on-dell-oem-ubuntu-installations?lang=EN
  sudo apt-get remove -y dell-super-key
  sudo apt-get install compizconfig-settings-manager -y
  sudo rm –rf /usr/share/gconf/defaults/40_oem-superkey-workaround || true
  # reboot, run "ccsm", find the "Ubuntu Unity Plugin" > "Launcher" > "Key to show the Dash" reset to default <Super>
  # then, to fixup touchpad: https://help.ubuntu.com/community/SynapticsTouchpad
fi

if !  grep nocaps /etc/default/keyboard; then
  sudo sed -i 's/XKBOPTIONS=""/XKBOPTIONS="ctrl:nocaps"/' /etc/default/keyboard
fi

# if [ ! -f ~/.config/nixpkgs/overlays/rust-overlay.nix ]; then
#   git clone https://github.com/mozilla/nixpkgs-mozilla.git ~/nixpkgs-mozilla
#   mkdir -p ~/.config/nixpkgs/overlays
#   ln -s $(pwd)/nixpkgs-mozilla/rust-overlay.nix ~/.config/nixpkgs/overlays/rust-overlay.nix
# fi

# if [ ! -f ~/.config/nixpkgs/config.nix ]; then
#   mkdir -p ~/.config/nixpkgs || true
#   cp ~/dotfiles/home/config/nixpkgs/config.nix ~/.config/nixpkgs/config.nix
# fi
# if ! [ -x "$(command -v slack)" ]; then
#   nix-env -i slack
# fi
#

# Ubuntu Software
# dropbox
# artha
# gcalculator (for RPN)
# zeal
# workrave
# hexchat

# pgadminIII
# tweak tool
# unity tweak tool

# hipchat
# slack
