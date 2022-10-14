#!/bin/sh

CONFIG_HOME=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." &> /dev/null && pwd)

rm -rf $HOME/.config-repo 
ln -s $CONFIG_HOME $HOME/.config-repo

sudo mkdir -p /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share

source ./scripts/setup-zsh.sh
source ./scripts/setup-brew.sh
source ./scripts/setup-node.sh
source ./scripts/setup-git.sh
source ./scripts/setup-apps.sh
source ./scripts/setup-dx.sh
