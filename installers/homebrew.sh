#!/bin/sh

# intel
if ! type brew >/dev/null 2>&1; then
  echo "start install and bundle brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# arm
cd /opt
sudo mkdir -p homebrew
sudo chown $USER:wheel homebrew
curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

# install brew bundle and brew-wrap
brew tap Homebrew/bundle
brew install rcmdnk/file/brew-file
brew-file set_repo -r git@github.com:chrhsmt/brew-file.git
brew update

# 先にXcode入れる
brew install mas
mas install 497799835
sudo xcodebuild -license accept

# homebrew-bundle
brew bundle --file ~/.config/brewfile/chrhsmt_brew-file/Brewfile

brew doctor

