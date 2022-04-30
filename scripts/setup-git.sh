#!/bin/sh

# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
# ssh-keygen -t ed25519 -C rich.burdon@gmail.com
# gh ssh-key add ~/.ssh/id_ed25519.pub --title burdon-xxx-cccc

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
