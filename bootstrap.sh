#!/bin/sh

cd ~

ln -s configs/zsh.rc .zsh.rc
ln -s configs/vim.rc .vim.rc
ln -s configs/tmux.conf .tmux.conf

echo "done"
