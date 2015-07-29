#!/bin/bash

# DO THESE FIRST
# git clone https://github.com/greglearns/dotfiles.git ~/.vim
# zsh / prezto: https://github.com/sorin-ionescu/prezto

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +BundleInstall +qall
mkdir ~/.vim/backup
mv ~/.vimrc ~/.gvimrc ~/.ackrc ~/.jshintrc ~/.gitconfig ~/.git-prompt.conf ~/.bash_profile ~/.zshrc ~/.tmux.conf ~/.vim/backup 

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
# iterm2
# skype
# sizeup
# docker
# alfred
# screenhero

brew install git
brew install cdargs
brew install reattach-to-user-namespace
brew install the_silver_searcher
brew install ctags
brew install npm
npm install -g jshint
# [sudo] npm install -g js-beautify
