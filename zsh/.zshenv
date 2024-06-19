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

# Node
export NODE_OPTIONS="$NODE_OPTIONS --max-old-space-size=8192"

# NX
export NX_CLOUD_ACCESS_TOKEN="ZmI2MDQ2OTYtODYwMy00ZDE3LTg0YTgtOWRjNzc3NDk1Zjk0fHJlYWQtd3JpdGU="

# DXOS
export DXOS_ROOT="$HOME/Code/dxos"

# DXOS Sentry logging
export DX_ENVIRONMENT=${$(hostname)%.*}

# DXOS CF Workers
export DX_WORKERS_API_KEY="EF07324B-2910-49EE-BB9C-7650BC10BF44"

# DXOS IPFS.
export IPFS_API_SECRET=basic:dxos:stackystack

# Runtime (for CLI, etc.)
export DXOS_FORCE_AUTOMERGE=true

# TODO(burdon): Change name.
export IPFS_API_SECRET=basic:dxos:stackystack

# Rust
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi
