#!/bin/sh

ROOT_DIR="$HOME/Code/richburdon/config"

echo
echo "### OS/X ###"
echo

#
# XCode
#

xcode-select --install

#
# iTerm
#

curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash

#
# Moom
# https://manytricks.com/osticket/kb/faq.php?id=53
#

pkill -f /Moom\.app/
defaults import com.manytricks.Moom "$ROOT_DIR/config/moom/Moom.plist"
open /Applications/Moom.app

