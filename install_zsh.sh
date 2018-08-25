#!/bin/sh

cd ~

sudo dnf install -y zsh

echo "Doing Oh My zsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k


echo "creating symlink"

rm .zshrc
ln -s configs/zshrc .zshrc

# Clone the zgen repository

git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

