#!/bin/bash
set -euxo pipefail

# DO THESE FIRST
# log in to github and bitbucket
# download and unzip https://github.com/greglearns/dotfiles.git somewhere other than ~/dotfiles
# cd <dir>; ./setup.sh

LALA=[ -x "$(command -v dmidecode)" ] && $(sudo dmidecode | grep Dell > /dev/null)
ISDELL=$?
echo ISDELL is "$ISDELL"

if ! [ -x "$(command -v curl)" ]; then
  sudo apt update
  sudo apt install curl -y
fi

command -v curl >/dev/null 2>&1 || { echo "I require curl but it's not installed.  Aborting." >&2; exit 1; }

if [ ! -d ~/.nix-profile ] && [ ! -f ~/.nix-profile ]; then
  echo installing nix
  # curl https://nixos.org/nix/install | sh
fi

if ! [ -x "$(command -v nix-env)" ]; then
  if [ -f ~/.nix-profile/etc/profile.d/nix.sh ]; then source ~/.nix-profile/etc/profile.d/nix.sh; fi
  # if [ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]; then source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh || true; fi
fi

if ! [ -x "$(command -v git)" ]; then
  nix-env -i git
fi

if ! [ -x "$(command -v xsel)" ]; then
  if [[ $ISDELL ]]; then nix-env -i xsel-unstable-2016-09-02; fi
fi

if [ ! -d ~/.ssh ]; then
  read -p "Enter your email address for the SSH key: " email
  ssh-keygen -t rsa -b 4096 -C $email
  # ssh-keygen -t rsa -b 4096 -C "greg@greglearns.com"
  if [ -x "$(command -v xsel)" ]; then
    xsel -b < ~/.ssh/id_rsa.pub
    chromium-browser https://github.com/settings/keys
    chromium-browser https://bitbucket.org/account/user/greglearns/ssh-keys/
  else
    pbcopy < ~/.ssh/id_rsa.pub
  fi
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
  nix-env -i vim tmux entr stow tree fd fzf ripgrep
fi

if ! [ -x "$(command -v jq)" ]; then
  nix-env -i jq
fi

if ! [ -x "$(command -v http)" ]; then
  nix-env -i httpie
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
  nix-env -i htop
  # nix-env -i atop iotop iftop
fi

if $ISDELL && ! [ -x "$(command -v xdotool)" ]; then
  nix-env -i xdotool
fi

if ! [ -x "$(command -v docker)" ]; then
  sudo groupadd docker || true
  # sudo usermod -aG docker $USER
  sudo dseditgroup -o edit -a $USER -t user docker
  # logout and back in to force reevaluation of group membership
  nix-env -i docker-17.05.0-ce
  nix-env -i docker-compose-1.13.0
  # sudo /home/greg/.nix-profile/bin/dockerd
fi

# if ! [ -x "$(command -v postgres)" ]; then
#   nix-env -i postgresql-9.6.2
#   echo "host    all             all             0.0.0.0/0            trust" | tee -a ~/tmp/pgdata/pg_hba.conf
#   echo "listen_addresses = '0.0.0.0'" | tee -a ~/tmp/pgdata/postgresql.conf
#   # https://www.johbo.com/2017/on-demand-postgresql-for-your-development-environment.html
#   # nix-shell -p postgresql
#   # export PGDATA=~/tmp/pgdata
#   # initdb -A trust
#   # pg_ctl start  # OR /home/greg/.nix-profile/bin/pg_ctl -D /home/greg/tmp/pgdata -l logfile start
#   # createdb myproject
# fi

# nix-env -i nixops

# # sudo apt-get update
# sudo apt-get upgrade
# sudo apt-get dist-upgrade
# Then reboot`

# if ! [ -x "$(command -v elm-make)" ]; then
#   nix-env -i elm-0.18.0
# fi


# install brew

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


if $ISDELL && [ ! -f /etc/X11/xorg.conf ]; then
  sudo cp ~/dotfiles/etc/X11/xorg.conf /etc/X11/xorg.conf

  sudo add-apt-repository ppa:atareao/atareao
  sudo apt-get update
  sudo apt-get install touchpad-indicator

  # http://www.dell.com/support/article/us/en/19/sln306440/xps-13-9360-ubuntu--killer-n1535-wireless-manual-firmware-update?lang=en
  # curl -L https://github.com/kvalo/ath10k-firmware/archive/master.zip > ~/ath10k.zip
  # extract here in the file, then...
  # sudo mv /lib/firmware/ath10k/QCA6174 ~/
  # sudo mv ~/ath10k-firmware-master/QCA6174 /lib/firmware/ath10k
  # ls /lib/firmware/ath10k/QCA6174
  # mv /lib/firmware/ath10k/QCA6174/hw3.0/firmware-4.bin_WLAN.RM.2.0-00180-QCARMSWPZ-1 /lib/firmware/ath10k/QCA6174/hw3.0/firmware-4.bin
fi

if $ISDELL && dpkg -s dell-super-key; then
  # https://www.dell.com/support/article/us/en/19/HOW12108/how-to-enable-the-ubuntu-super-key-on-dell-oem-ubuntu-installations?lang=EN
  sudo apt-get remove -y dell-super-key
  sudo apt-get install compizconfig-settings-manager -y
  sudo rm –rf /usr/share/gconf/defaults/40_oem-superkey-workaround || true
  # reboot, run "ccsm", find the "Ubuntu Unity Plugin" > "Launcher" > "Key to show the Dash" reset to default <Super>
  # then, to fixup touchpad: https://help.ubuntu.com/community/SynapticsTouchpad
fi

if [ -f /etc/default/keyboard ] && ! grep nocaps /etc/default/keyboard; then
  sudo sed -i 's/XKBOPTIONS=""/XKBOPTIONS="ctrl:nocaps"/' /etc/default/keyboard
fi

if ! [ -x "$(command -v rustup)" ]; then
  curl https://sh.rustup.rs -sSf | sh
  cargo install cross
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
# galculator (for RPN)
# zeal
# workrave
# hexchat

# pgadminIII
# tweak tool
# unity tweak tool

# hipchat
# slack

# https://justgetflux.com/linux.html

brew install npm
npm install -g commitizen
npm install -g cz-conventional-changelog
# npm install -g conventional-changelog-cli
cargo install clog-cli
npm install hjson -g
curl https://get.volta.sh | bash


# https://www.wezm.net/v2/posts/2020/100-rust-binaries/
# emulsion
# gitui
# broot
# alacritty
# https://github.com/sharkdp/pastel
# https://github.com/watchexec/watchexec
# https://github.com/chmln/sd  -- sed replacement
# https://github.com/hatoo/oha  -- load tester
# https://swc.rs/  -- babel competitor
# https://starship.rs/
# https://github.com/imsnif/bandwhich
# https://github.com/ajeetdsouza/zoxide
# https://gitlab.com/dns2utf8/color_blinder
# https://github.com/marcusbuffett/pipe-rename
# https://volta.sh/  -- npm
# https://github.com/orf/ptail
# https://github.com/dalance/procs  -- ps replacement
# https://github.com/jantap/rsmixer  -- audio mixer per app
# https://github.com/Edu4rdSHL/fhc  -- namecheap checker
# https://github.com/aeshirey/waitfor
# https://github.com/Nukesor/pueue


