#
# Aliases
#

# http://irtfweb.ifa.hawaii.edu/~lockhart/gpg
# https://www.gnupg.org/gph/en/manual/book1.html
_gpg_copy() {
  gpg --export -a "$1" | pbcopy
}

alias gpg-keys="gpg --list-keys"
alias gpg-copy="_gpg_copy"
alias gpg-search="gpg --keyserver=$KEY_SERVER --search-keys="

# https://github.com/nosarthur/gita
# pip3 install -U gita --user
alias gita="python3 -m gita"

alias l="ls -og"
alias ll="ls -aog"

alias home="cd $PROJECTS_HOME"

# TODO(burdon): npx @dxos/fu loc
alias loc="find . -type d -name "node_modules" -prune -o -type d -name ".git" -prune -o -type d -name ".idea" -prune -o -type d -name "dist" -prune -o -type f -print | wc"

# TODO(burdon): Create DXOS CLI.
#SNIPPETS="~/iCloud/System/scripts/snippets.md"
#alias zsp="cat $SNIPPETS"
#alias zsp_edit="code $SNIPPETS"

# Edit this file.
alias zed="code ~/.zsh"
