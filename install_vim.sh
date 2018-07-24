#!/bin/sh

cd ~

echo "Installing"

sudo dnf install -y vim

echo "creating symlink"

rm .vimrc
ln -s configs/vimrc .vimrc

echo "Installing Vundle"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c PluginInstall -c quitall
