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

brew upgrade node-build

npx @nodenv/nodenv-installer
nodenv install $NODE_VERSION
nodenv global $NODE_VERSION
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-doctor | bash
nodenv init

npm install -g yarn

#
# Rush
#

npm install -g pnpm
npm install -g @microsoft/rush
