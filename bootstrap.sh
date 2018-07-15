#!/bin/sh

echo "Installing stuff"

sudo dnf update -y
sudo dnf install -y git python3-pip python3-ipython htop util-linux-user redhat-rpm-config python3-devel
sudo pip3 install -y thefuck

echo "creating symlinks"

ln -s configs/tmux.conf .tmux.conf
