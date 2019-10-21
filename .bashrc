# alias
alias 'll'='ls -al'
alias 'be'='bundle exec'

# history
export HISTSIZE=2000
export HISTFILESIZE=2000
export HISTCONTROL=ignoreboth
export HISTIGNORE=ls:ll:exit:cd:

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export PATH="/usr/local/sbin:$HOME/Library/Android/sdk/platform-tools/:$PATH"

if [ -f /usr/local/etc/brew-wrap ];then
	
source /usr/local/etc/brew-wrap
fi

export EDITOR=$(which vim)
source ~/.bin/tmuxinator.bash

# esp32
export PATH=$PATH:$HOME/esp32/xtensa-esp32-elf/bin
export IDF_PATH=$HOME/esp32/esp-idf

export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

export PATH="usr/local/opt/mysql@5.6/bin:$PATH"

# aws
export "PATH=~/aws/bin:$PATH"

#export PATH="~/.cabal/bin:$PATH"
#export PATH="/Users/chihiro/.ghcup/bin:$PATH"
#export PATH="/Users/chihiro/.ghcup/env:$PATH"

export PATH="$PATH:/Users/chihiro/Documents/flutter/bin"
export THOR_MERGE=mergetool_for_rails_generator

export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="/usr/local/opt/mongodb-community@3.4/bin:$PATH"
