#!/bin/sh

cd ~

echo "Installing stuff"

sudo dnf install vim git python3-ipython tmux zsh htop util-linux-user redhat-rpm-config python3-devel
sudo pip3 install thefuck

echo "Doing Oh My zsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


echo "creating symlinks"

ln -s configs/zshrc .zshrc
ln -s configs/vimrc .vimrc
ln -s configs/tmux.conf .tmux.conf



echo "Installing Vundle"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c PluginInstall -c quitall

echo "done"
