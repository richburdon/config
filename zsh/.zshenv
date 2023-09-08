#
# This is read first.
#

# Root for .zsh
export ZDOTDIR="${ZDOTDIR:-$HOME/.zsh}"

# Brew
export HOMEBREW_NO_ANALYTICS=1

# GPG
export KEY_SERVER="hkp://pool.sks-keyservers.net"

# iTerm2
export DISABLE_AUTO_TITLE="true"
export HISTSIZE=10000
setopt EXTENDED_HISTORY

# EDITOR
export EDITOR=code

# DXOS Sentry logging
export DX_ENVIRONMENT=${$(hostname)%.*}

# DXOS
export DXOS_ROOT="$HOME/Code/dxos"

# Rust
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi
