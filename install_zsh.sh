#!/bin/sh

cd ~

sudo dnf install -y zsh powerline-fonts

echo "Doing Oh My zsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
