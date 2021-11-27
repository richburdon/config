#!/bin/sh

xcode-select --install

CONFIG_DIR="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

#
# Moom
#

pkill -f /Moom\.app/
defaults import com.manytricks.Moom "$CONFIG_DIR/Moom/com.manytricks.Moom.plist"
open /Applications/Moom.app
