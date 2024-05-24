#!/bin/sh

echo
echo "### BREW ###"
echo

#
# New system set-up.
#

if ! command -v brew &> /dev/null
then
  echo "### Installing brew ###"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

MODULES=(
  coreutils
  deno          # https://deno.land/manual@v1.26.0/getting_started/installation
  gh
  git
  go
  fzf           # https://github.com/junegunn/fzf/tree/c60ed1758315f0d993fbcbf04459944c87e19a48#installation
  jq
  htop
  keybase
  HTTPie        # https://formulae.brew.sh/formula/httpie
  mosh          # https://mosh.org
  nginx
  openssl
  starship      # https://starship.rs
  zoxide
  zsh           # https://ohmyz.sh
)

CASKS=(
# ipfs
  ngrok         # https://dashboard.ngrok.com/get-started/setup
)

set -x

brew update

# TODO(burdon): Option to reinstall.

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
