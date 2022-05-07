#!/bin/sh

echo
echo "### NodeJS ###"
echo

NODE_VERSION=16.14.0

# Required to see new versions of Node
# brew upgrade n node-build

# To fix n:
# sudo chown -R $USER "/usr/local/n"

#
# ARM vs Intel.
# Brew install binaries in difference locations based on the architecture.
# arch -arm64 brew reinstall nodenv
# arch -arm64 nodenv install 16.14.2
#
# .zsh/.zprofile
# eval "$(/opt/homebrew/bin/brew shellenv)"
#
# ARM:
#   /opt/homebrew/bin/brew
#   /opt/homebrew/Cellar
# Intel:
#   /usr/local/bin/brew
#   /usr/local/Cellar/
#
# To determine the NodeJS architecture:
# node -e "console.log(process.arch)"
#

#
# Build tools
#

PACKAGES=(
  corepack
  yarn
  pnpm
  @microsoft/rush
  sort-package-json
)

for package in "${PACKAGES[@]}"; do
  npm install -g --force $package
done

npm -g list

echo "Run rehash to update."

