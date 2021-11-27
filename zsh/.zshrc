#
# $ZDOTDIR/.zshrc
# Interactive shell configuration. Loaded after ~/.zshenv (which may set ZDOTDIR).
# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout
#

#
# ENV
#

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Git
export PROJECTS_HOME="$HOME/Code/dxos"

# GPG
export KEY_SERVER="hkp://pool.sks-keyservers.net"

#
# Oh My Zsh
#

# https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="dxos"
# ZSH_THEME="af-magic"
ZSH_THEME="avit"

# https://github.com/robbyrussell/oh-my-zsh#plugins
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
plugins=(
  dxos
  encode64              # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/encode64
# fzf                   # CTRL+T to find files; CTRL+R to search history
  git
# github                # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/github
# gpg-agent
  history               # Grep history: `h MATCH`
# keychain
  macos                 # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/osx (tab, cdf)
  web-search
  yarn
  z                     # Switch directory: `z MATCH`
  zsh-autosuggestions
# ssh-agent
)

#ZSH_CUSTOM=~/.oh-my-zsh/custom/plugins
source ~/.oh-my-zsh/oh-my-zsh.sh

#
# Zsh Extensions
#

# Smart history search.
# https://github.com/junegunn/fzf/tree/c60ed1758315f0d993fbcbf04459944c87e19a48#installation
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#
# Dev
#

# Nodenv
# https://github.com/nodenv/nodenv
# NOTE: run `nodenv rehash` after installing global packages.
eval "$(nodenv init -)"

# Rust
source "$HOME/.cargo/env"

#
# Custom
#

source "$ZDOTDIR/alias.zsh"
source "$ZDOTDIR/chrome.zsh"
