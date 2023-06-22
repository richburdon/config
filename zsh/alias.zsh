#
# Aliases
# 

alias ls="gls --color=tty"
alias l="ls -l -og --time-style=long-iso"
alias ll="ls -la -og --time-style=long-iso"

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

function help() {
  open "https://www.mankier.com/1/$1"
}

# Edit this file.
# alias zed="code --wait ~/.zsh ~/.zsh/alias.zsh && rehash && exec zsh"
alias zed="code ~/.config-repo"
alias up="rehash && exec zsh"

# Git
alias gc="git commit -a --allow-empty-message -m ''"
# alias gc="git commit -a --amend --allow-empty-message -m ''"

# Update main then merge with this branch.
alias gmm="git fetch && git merge --no-ff --no-edit origin/main"

# Push branch for the first time.
alias gpp='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'

# TODO(burdon): Delete up-to-date branches?
alias gdb="git fetch -p && git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D"

# https://github.com/nosarthur/gita
alias gita="python3 -m gita"

# Tools
alias ws="webstorm"

#
# Search the local git reflog for string in specific file modified in commit.
# Examples:
# greplog "foo"
# greplog "foo" ./README.md
#
# git show 9d343f8e                       // Show all changes.
# git show 9d343f8e:                      // Show files in ref.
#
# git checkout $HASH -- $PATH             // Checkout file from ref.
# git checkout $HASH~1 -- $PATH           // Checkout (deleted) file from previous ref.
#
function grep-log() {
  obj=""
  if [ -n "$2" ]; then
    obj=":$2"
  fi
  for commit in $(git reflog|cut -d' ' -f1|sort|uniq); 
  do 
    # echo "[$commit$obj]"
    # TODO(burdon): Show matching file (and line?)
    git show "$commit$obj" &>/dev/null | grep -i "$1" | \
      while read line; do echo "$commit $line"; done; 
  done
}

# show files that match pattern.
function grep-files() {
  MATCH=$1
  ROOT=$2
  EXT=$3
  grep -l -R --include \*.${EXT:=ts} "$MATCH" ${ROOT:=./packages}
}
