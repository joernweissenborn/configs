#!/bin/sh

echo "Installing stuff"

sudo dnf update -y
sudo dnf install -y git python3-pip python3-ipython flake8 guake htop util-linux-user redhat-rpm-config python3-devel gcc-c++ make
sudo pip3 install thefuck

echo "configuring git"

git config --global user.name "Joern Weissenborn"
git config --global user.email joern.weissenborn@gmail.com
git config --global user.signingkey joern.weissenborn@gmail.com
git config --global commit.gpgSign true

echo "setup for nitrokey"

sudo systemctl stop pcscd
sudo systemctl disable pcscd

echo "use-agent" > $HOME/.gnupg/gpg.conf
echo "enable-ssh-support" > $HOME/.gnupg/gpg-agent.conf
