#!/bin/sh

echo
echo "### ZSH ###"
echo

cd $HOME

#
# Oh My Zsh
# https://github.com/ohmyzsh/ohmyzsh/tree/93cc3964e2d265ab0571298d69d2eed0a65d13f2
#

# Install.
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# https://github.com/zsh-users/zsh-autosuggestions/blob/ae315ded4dba10685dbbafbfa2ff3c1aefeb490d/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

CONFIG=$HOME/Code/richburdon/config

rm -f $HOME/.zsh
ln -s $CONFIG/zsh $HOME/.zsh

rm -rf $HOME/.zshenv
echo 'ZDOTDIR="${ZDOTDIR:-$HOME/.zsh}"' > $HOME/.zshenv

# Many tools want to append here.
rm -f $HOME/.zprofile
rm -f $HOME/.zshrc
ln -s $HOME/.zsh/$HOME.zprofile
ln -s $HOME/.zsh/$HOME.zshrc

# https://antigen.sharats.me
curl -L git.io/antigen > $HOME/.zsh/antigen.zsh
