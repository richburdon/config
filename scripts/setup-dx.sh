#!/bin/sh

echo
echo "### X ###"
echo

yarn global remove @dxos/x
yarn global add @dxos/x

echo
echo "### DX ###"
echo

yarn global remove @dxos/cli
yarn global add @dxos/cli
