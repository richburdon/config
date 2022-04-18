#
# $ZDOTDIR/.zshrc
# Interactive shell configuration. Loaded after ~/.zshenv (which may set ZDOTDIR).
# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout
# To reset: `exec zsh`
#

source '/Users/burdon/.zsh/antigen.zsh'

#
# ENV
#

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Ruby
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"

# Git
export DXOS_ROOT="$HOME/Code/dxos"

# GPG
export KEY_SERVER="hkp://pool.sks-keyservers.net"

# iTerm2
export DISABLE_AUTO_TITLE="true"

export HISTSIZE=10000
setopt EXTENDED_HISTORY

#
# Oh My Zsh
#

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Custom DXOS plugin.
antigen bundle ~/.oh-my-zsh/custom/plugins/dxos

antigen apply

# TODO(burdon): Theme issues with Warp.
# https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="dxos"
ZSH_THEME="avit"

# TODO(burdon): Move to antigen.
# https://github.com/robbyrussell/oh-my-zsh#plugins
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
plugins=(
  encode64              # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/encode64
# fzf                   # CTRL+T to find files; CTRL+R to search history
  git
  history               # Grep history: `h MATCH`
  macos                 # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/osx (tab, cdf)
  web-search
  yarn
  z                     # Switch directory: `z MATCH`
)

export ZSH_CACHE_DIR=~/.zcompdump
export ZSH_COMPDUMP="${ZSH_CACHE_DIR}/.zcompdump-${(%):-%m}-${ZSH_VERSION}"

source ~/.oh-my-zsh/oh-my-zsh.sh

#
# Zsh Extensions
#

# Smart history search.
# brew install fzf
# https://github.com/junegunn/fzf/tree/c60ed1758315f0d993fbcbf04459944c87e19a48#installation
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS='--query "!node_modules !dist "'

#
# Dev
#

# Nodenv
# https://github.com/nodenv/nodenv
# NOTE: run `nodenv rehash` after installing global packages.
eval "$(nodenv init -)"

# NVM
# https://github.com/nvm-sh/nvm
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# rbenv for Jekyll support.
# https://jekyllrb.com/docs/installation/macos/#rbenv
# eval "$(rbenv init - zsh)"

# Rust
# https://www.rust-lang.org/tools/install
# source "$HOME/.cargo/env"

# Go
# https://go.dev/doc/install

#
# Custom
#

source "$ZDOTDIR/alias.zsh"
source "$ZDOTDIR/chrome.zsh"
