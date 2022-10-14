#!/bin/sh

echo
echo "### NodeJS ###"
echo

CONFIG=$HOME/.config-repo

rm -rf $HOME/.npmrc
ln -s $CONFIG/.npmrc $HOME/.npmrc

# https://docs.npmjs.com/cli/v7/commands/npm-config
# https://www.npmjs.com/package/n#installation

sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n

#
# Build tools
#

PACKAGES=(
  @microsoft/rush
  corepack
  git-branch-select
  jq
  monorepo-cd
  n
  pnpm@7.9.0
  sort-package-json
  yarn
)

for package in "${PACKAGES[@]}"; do
  npm install -g --force $package
done

npm -g list

n doctor
NODE_VERSION=16.14.0
sudo n i $NODE_VERSION

echo "Run rehash to update."
