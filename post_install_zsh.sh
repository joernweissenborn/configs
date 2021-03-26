#!/bin/sh


git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k


echo "creating symlink"

rm $HOME/.zshrc
ln -s $HOME/configs/zshrc $HOME/.zshrc

# Clone the zgen repository

git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# autosuggestions

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
