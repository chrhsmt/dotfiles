#!/bin/bash

set -eu

echo "bootstrap..."

# Command Line Tools for Xcode
echo "xcode-select --install"
xcode-select --install

# clone repo
echo "setup dotfiles"
WORKDIR=~/src/github.com/chrhsmt/dotfiles
mkdir -p $WORKDIR
git clone https://github.com/chrhsmt/dotfiles.git $WORKDIR
cd $WORKDIR
