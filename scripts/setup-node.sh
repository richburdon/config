#!/bin/sh

echo
echo "### NodeJS ###"
echo

#
# https://www.jurnalanas.com/node-js-mac-m1
# https://www.courier.com/blog/tips-and-tricks-to-setup-your-apple-m1-for-development/
# NOTE: This will fail if `Open with Rosetta` is set in the iTerm config (Right-click Info).
#

softwareupdate --install-rosetta --agree-to-license

#
# Nodenv
# Clean-up previous versions of node and yarn:
# https://github.com/nodenv/nodenv#homebrew-on-macos
# brew uninstall --ignore-dependencies node
#

# curl -o- -L https://yarnpkg.com/install.sh | bash

NODE_VERSION=16.14.2

# Required to see new versions of Node
brew upgrade nodenv node-build

nodenv install $NODE_VERSION
nodenv global $NODE_VERSION
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-doctor | bash
nodenv init

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

npm install -g corepack
npm install -g yarn
npm install -g pnpm
npm install -g @microsoft/rush

reshash
