#!/bin/sh

cd ~

sudo dnf install -y zsh

echo "Doing Oh My zsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "creating symlink"

rm .zshrc
ln -s configs/zshrc .zshrc
