#
# Aliases
#

alias l="ls -og"
alias ll="ls -aog"

alias home="cd $DXOS_ROOT"

# http://irtfweb.ifa.hawaii.edu/~lockhart/gpg
# https://www.gnupg.org/gph/en/manual/book1.html
_gpg_copy() {
  gpg --export -a "$1" | pbcopy
}

alias gpg-copy="_gpg_copy"
alias gpg-keys="gpg --list-keys"
alias gpg-search="gpg --keyserver=$KEY_SERVER --search-keys="

# TODO(burdon): Move to x.
alias loc="find . -type d -name "node_modules" -prune -o -type d -name ".git" -prune -o -type d -name ".idea" -prune -o -type d -name "dist" -prune -o -type f -print | wc"

_find() {
  find . -iregex ".*$1.*"
}
alias f="_find"

_help() {
  open "https://www.mankier.com/1/$1"
}
alias help="_help"

# Edit this file.
alias zed="code ~/.zsh"
alias up="rehash && exec zsh"

# Git
alias gb="git branch -vv"
alias gs="git-branch-select -l"
alias gc="git commit -a --allow-empty-message -m ''"
# Update main then merge with this branch.
alias gmm="git fetch && git merge origin/main"
# Push branch for the first time.
alias gpp='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
# TODO(burdon): Delete up-to-date branches?
alias gdb="git fetch -p && git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D"

# https://github.com/nosarthur/gita
alias gita="python3 -m gita"

# NX
alias pnx='pnpm nx'

# Tools
alias ws="webstorm"
