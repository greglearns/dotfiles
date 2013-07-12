#!/bin/bash -e

# git clone git@github.com:greglearns/dotvim.git ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
mkdir ~/.vim/backup
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
ln -s ~/.vim/ackrc ~/.ackrc
ln -s ~/.vim/gitconfig ~/.gitconfig
ln -s ~/.vim/git-prompt.conf ~/.git-prompt.conf
ln -s ~/.vim/bash_profile ~/.bash_profile
ln -s ~/.vim/tmux.conf ~/.tmux.conf
ln -s ~/.vim/voom_mode_greg.py ~/.vim/bundle/VOoM/plugin/voom/voom_mode_greg.py
vim +BundleInstall +qall

