#!/bin/sh

echo
echo "### Git ###"
echo

cp -f ./config/.gitconfig ~/

git config --global pager.branch false

# https://cli.github.com
gh config set pager cat

# https://www.npmjs.com/package/git-branch-select
npm install --global git-branch-select

# https://github.com/nosarthur/gita
# alias gita="python3 -m gita"
pip3 install -U gita
