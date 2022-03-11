#!/bin/sh

#
# New system set-up.
#

if ! command -v brew &> /dev/null
then
  echo "### Installing brew ###"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

MODULES=(
  coreutils
  gh
  git
  go
  fzf           # https://github.com/junegunn/fzf/tree/c60ed1758315f0d993fbcbf04459944c87e19a48#installation
  htop
  HTTPie        # https://formulae.brew.sh/formula/httpie
  jq
  nginx
  nodenv	      # https://github.com/nodenv/nodenv
  node-build
  openssl
  pnpm
  zsh           # https://ohmyz.sh
)

CASKS=(
  ipfs
  ngrok         # https://dashboard.ngrok.com/get-started/setup
)

set -x

brew update

for module in "${MODULES[@]}"; do
  brew install $module
done

for module in "${CASKS[@]}"; do
  brew install --cask $module
done

#
# Done
#

brew list -1 | xargs brew upgrade

#
# Extras
#

$(brew --prefix)/opt/fzf/install
