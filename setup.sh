#!/bin/bash -e

# DO THESE FIRST
# git clone https://github.com/greglearns/dotfiles.git ~/.vim
# zsh / prezto: https://github.com/sorin-ionescu/prezto

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim || true

vim +BundleInstall +qall
mkdir ~/.vim/backup
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
ln -s ~/.vim/ackrc ~/.ackrc
ln -s ~/.vim/jshintrc ~/.jshintrc
ln -s ~/.vim/gitconfig ~/.gitconfig
ln -s ~/.vim/git-prompt.conf ~/.git-prompt.conf
ln -s ~/.vim/bash_profile ~/.bash_profile
ln -s ~/.vim/zshrc ~/.zshrc
ln -s ~/.vim/tmux.conf ~/.tmux.conf
# ln -s ~/.vim/voom_mode_greg.py ~/.vim/bundle/VOoM/plugin/voom/voom_mode_greg.py

# npm install -g watchy
brew install npm tmux vim chromedriver
# install
# chromedriver
# screenhero
# hipchat
# skype
# sizeup
# vagrant
# iterm2
# alfred


