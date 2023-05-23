#
# $ZDOTDIR/.zshrc
# Interactive shell configuration. Loaded after ~/.zshenv (which may set ZDOTDIR).
# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout
# To reset: `exec zsh`
#

#
# https://apple.stackexchange.com/questions/388622/zsh-zprofile-zshrc-zlogin-what-goes-where
#
# .zshenv (environment variables: read first)
# .zprofile (login shell)
# .zshrc (interactive shell: read after .zprofile)
# .zlogin (login shell)
# .zlogout (when the shell exits)
#

#
# Oh My Zsh
#

source '/Users/burdon/.zsh/antigen.zsh'

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Custom DXOS plugin.
antigen bundle ~/.oh-my-zsh/custom/plugins/dxos

antigen apply

# TODO(burdon): Theme issues with Warp.
# https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# TODO(burdon): https://docs.warp.dev/help/known-issues#list-of-incompatible-tools
# ZSH_THEME="dxos"
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  ZSH_THEME="avit"
fi

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
# iTerm
#

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#
# Zsh Extensions
#

# Smart history search.
# brew install fzf
# https://github.com/junegunn/fzf/tree/c60ed1758315f0d993fbcbf04459944c87e19a48#installation
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS='--query "!node_modules !dist "'

#
# Custom
#

source "$ZDOTDIR/alias.zsh"
source "$ZDOTDIR/chrome.zsh"

# ruby
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/burdon/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# bun completions
[ -s "/Users/burdon/.bun/_bun" ] && source "/Users/burdon/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
test -e /Users/burdon/.zsh/.iterm2_shell_integration.zsh && source /Users/burdon/.zsh/.iterm2_shell_integration.zsh || true

# go
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"
