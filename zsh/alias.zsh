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

function help() {
  open "https://www.mankier.com/1/$1"
}

# Edit this file.
# alias zed="code --wait ~/.zsh ~/.zsh/alias.zsh && rehash && exec zsh"
alias zed="code ~/.zsh"
alias up="rehash && exec zsh"

# Git
alias gb="git branch -vv"
alias gs="git-branch-select -l"

alias gc="git commit -a --allow-empty-message -m ''"

# Update main then merge with this branch.
alias gmm="git fetch && git fetch origin main:main && git merge main"

# Push branch for the first time.
alias gpp='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'

# TODO(burdon): Delete up-to-date branches?
alias gdb="git fetch -p && git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D"

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
function greplog() {
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

# https://github.com/nosarthur/gita
alias gita="python3 -m gita"

# https://github.com/dmaretskyi/monorepo-cd
eval "$(monorepo-cd --init m)"

# NX
# pnpm nx run-many --target=build
# pnpm nx build <target> --watch
alias px="pnpm -w nx"

# p build
function p () {
  px $1 "${PWD##*/}"
}

# Clean and build.
alias fak="git pull && git clean -xdf && pnpm i && px run-many --target build"
alias ci="px run-many --target build && px run-many --target test && px run-many --target lint"

# TODO: Implement with x
# x build
# x test
# x - client-serv (complete)
# beast client (draw graph)

# Tools
alias ws="webstorm"
