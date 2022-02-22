#!/bin/sh

#
# Nodenv
# Clean-up previous versions of node and yarn:
# https://github.com/nodenv/nodenv#homebrew-on-macos
# brew uninstall --ignore-dependencies node
#

# curl -o- -L https://yarnpkg.com/install.sh | bash

npx @nodenv/nodenv-installer
nodenv install 15.14.0
nodenv global 15.14.0
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-doctor | bash
nodenv init

npm install -g yarn

#
# Rush
#

npm install -g @microsoft/rush
