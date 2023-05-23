#!/bin/sh

echo
echo "### ZSH ###"
echo

CONFIG_HOME=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." &> /dev/null && pwd)

rm -rf $HOME/.config-repo 
ln -s $CONFIG_HOME $HOME/.config-repo

sudo mkdir -p /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share

sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n

#
# Zsh
# Create symlinks
# Many tools want to append to these files.
#

FILES=(
  .zprofile
  .zshenv
  .zshrc
)

rm -f $HOME/.zsh
ln -s $CONFIG_HOME/zsh $HOME/.zsh

for file in "${FILES[@]}"; do
  echo "Linking $file"
  rm -rf $HOME/$file
  ln -s $HOME/.zsh/$file $HOME/$file
done

# Check if already installed.
which zsh && exit
echo "Installing zsh..."

#
# Oh My Zsh
# https://github.com/ohmyzsh/ohmyzsh/tree/93cc3964e2d265ab0571298d69d2eed0a65d13f2
#

# Install.
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# https://github.com/zsh-users/zsh-autosuggestions/blob/ae315ded4dba10685dbbafbfa2ff3c1aefeb490d/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# https://antigen.sharats.me
curl -L git.io/antigen > $HOME/.zsh/antigen.zsh
