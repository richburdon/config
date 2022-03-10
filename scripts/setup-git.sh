#!/bin/sh

cp -f ./config/.gitconfig ~/

git config --global pager.branch false

gh config set pager cat

# https://www.npmjs.com/package/git-branch-select
npm install --global git-branch-select
