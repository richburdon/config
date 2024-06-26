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
# TODO(burdon): https://docs.warp.dev/help/known-issues#list-of-incompatible-tools
# ZSH_THEME="dxos"
# https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  ZSH_THEME="dxos"
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
export ZSH_CUSTOM=~/.oh-my-zsh/custom

source ~/.oh-my-zsh/oh-my-zsh.sh

# Starship prompt
eval "$(starship init zsh)"

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

# update tab title to current directory
if [ $ITERM_SESSION_ID ]; then
precmd() {
  echo -ne "\033]0;${PWD##*/}\007"
}
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
test -e /Users/burdon/.zsh/.iterm2_shell_integration.zsh && source /Users/burdon/.zsh/.iterm2_shell_integration.zsh || true

# go
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

DX_AC_ZSH_SETUP_PATH=/Users/burdon/Library/Caches/dx/autocomplete/zsh_setup && test -f $DX_AC_ZSH_SETUP_PATH && source $DX_AC_ZSH_SETUP_PATH; # dx autocomplete setup

# TODO(burdon): Messes with prompt.
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
    # eval "$__conda_setup"
# else
    # if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        # . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    # else
        # export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    # fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.1.3
# Shell-GPT integration ZSH v0.1
_sgpt_zsh() {
if [[ -n "$BUFFER" ]]; then
    _sgpt_prev_cmd=$BUFFER
    BUFFER+="⌛"
    zle -I && zle redisplay
    BUFFER=$(sgpt --shell <<< "$_sgpt_prev_cmd")
    zle end-of-line
fi
}
zle -N _sgpt_zsh
bindkey ^l _sgpt_zsh
# Shell-GPT integration ZSH v0.1
