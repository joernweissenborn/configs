#!/bin/sh

#p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k


echo "creating symlink"

rm -f $HOME/.zshrc
ln -s $HOME/configs/zshrc $HOME/.zshrc

rm -f $HOME/.p10k.zsh
ln -s $HOME/configs/p10k.zsh $HOME/.p10k.zsh

# Clone the zgen repository

git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# autosuggestions

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
