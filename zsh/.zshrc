#
# $ZDOTDIR/.zshrc
# Interactive shell configuration. Loaded after ~/.zshenv (which may set ZDOTDIR).
# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout
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

#export ZSH="$HOME/.oh-my-zsh"
#ZSH_CUSTOM=~/.oh-my-zsh/custom/plugins

source ~/.oh-my-zsh/oh-my-zsh.sh

#
# ENV
#

export PROJECTS_HOME="$HOME/Code/dxos"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#
# Extensions
#

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# https://github.com/nodenv/nodenv
# NOTE: run `nodenv rehash` after installing global packages.
eval "$(nodenv init -)"

source "$ZDOTDIR/alias.zsh"
