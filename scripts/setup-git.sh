#!/bin/sh

cp -f ./config/.gitconfig ~/

git config --global pager.branch false

gh config set pager cat
