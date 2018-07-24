#!/bin/sh

echo "Installing stuff"

sudo dnf update -y
sudo dnf install -y git python3-pip python3-ipython flake8 guake htop util-linux-user redhat-rpm-config python3-devel gcc-c++ make
sudo pip3 install thefuck
