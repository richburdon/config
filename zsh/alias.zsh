#
# Aliases
#

# http://irtfweb.ifa.hawaii.edu/~lockhart/gpg
# https://www.gnupg.org/gph/en/manual/book1.html
_gpg_copy() {
  gpg --export -a "$1" | pbcopy
}

alias gpg-copy="_gpg_copy"
alias gpg-keys="gpg --list-keys"
alias gpg-search="gpg --keyserver=$KEY_SERVER --search-keys="

alias gc="git commit -a --allow-empty-message -m ''"

alias l="ls -og"
alias ll="ls -aog"

alias home="cd $PROJECTS_HOME"

alias loc="find . -type d -name "node_modules" -prune -o -type d -name ".git" -prune -o -type d -name ".idea" -prune -o -type d -name "dist" -prune -o -type f -print | wc"

_help() {
  open "https://www.mankier.com/1/$1"
}

alias help="_help"

# Edit this file.
alias zed="code ~/.zsh"
alias up="exec zsh"
