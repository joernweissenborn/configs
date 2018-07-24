
#!/bin/sh

cd ~

echo "Installing stuff"

sudo dnf install -y tmux

echo "creating symlink"

rm .tmux.conf
ln -s configs/tmux.conf .tmux.conf
