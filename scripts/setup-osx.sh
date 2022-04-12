#!/bin/sh

echo
echo "### OS/X ###"
echo

xcode-select --install

CONFIG_DIR="$HOME/Code/richburdon/config/config"

#
# Moom
# https://manytricks.com/osticket/kb/faq.php?id=53
#

pkill -f /Moom\.app/
defaults import com.manytricks.Moom "$CONFIG_DIR/moom/Moom.plist"
open /Applications/Moom.app
