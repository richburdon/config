#!/bin/sh

#
# Oh My Zsh
# https://github.com/ohmyzsh/ohmyzsh/tree/93cc3964e2d265ab0571298d69d2eed0a65d13f2
#

# Install.
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# https://github.com/zsh-users/zsh-autosuggestions/blob/ae315ded4dba10685dbbafbfa2ff3c1aefeb490d/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

rm ~/.zsh
ln -s ~/Code/richburdon/config/zsh ~/.zsh

rm -rf ~/.zshenv
echo 'ZDOTDIR="${ZDOTDIR:-$HOME/.zsh}"' > ~/.zshenv

# https://antigen.sharats.me
curl -L git.io/antigen > ~/.zsh/antigen.zsh
