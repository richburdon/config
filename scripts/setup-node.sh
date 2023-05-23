#!/bin/sh

echo
echo "### NodeJS ###"
echo

CONFIG=$HOME/.config-repo

rm -rf $HOME/.npmrc
ln -s $CONFIG/.npmrc $HOME/.npmrc

# https://docs.npmjs.com/cli/v7/commands/npm-config
# https://www.npmjs.com/package/n#installation

#
# Build tools
# To remove all globally installed packages: `rm -rf /usr/local/lib/node_modules`
#

PACKAGES=(
  corepack
  git-branch-select
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
NODE_VERSION=16.13.0
sudo n i $NODE_VERSION

echo "Run rehash to update."
