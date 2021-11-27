#!/bin/sh

set -x

#
# New system set-up.
#

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

MODULES=(
  coreutils
  gh
  git
  go
  fzf           # https://github.com/junegunn/fzf/tree/c60ed1758315f0d993fbcbf04459944c87e19a48#installation
  htop
  HTTPie        # https://formulae.brew.sh/formula/httpie
  ipfs
  jq
  nginx
  nodenv	      # https://github.com/nodenv/nodenv
  node-build
  openssl
  zsh           # sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
)

brew update

for module in "${MODULES[@]}"; do
  brew install "$module"
done

#
# Done
#

brew list -1 | xargs brew upgrade
