#!/bin/sh

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install brew bundle and brew-wrap
brew tap Homebrew/bundle
brew install rcmdnk/file/brew-file
brew set_repo -r git@github.com:chrhsmt/brew-file.git
# brew file install

# homebrew-bundle
brew bundle #--file ~/Brewfile