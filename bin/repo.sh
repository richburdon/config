#!/bin/sh

git remote get-url origin 2>/dev/null | sed -n 's#.*/\([^.]*\)\.git#\1#p'
