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

if [ -f $(brew --prefix)/etc/brew-wrap ];then
source $(brew --prefix)/etc/brew-wrap
fi

export EDITOR=$(which vim)
source ~/.bin/tmuxinator.bash

# esp32
export PATH=$PATH:$HOME/esp32/xtensa-esp32-elf/bin
export IDF_PATH=$HOME/esp32/esp-idf

export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/Users/chihiro/.sdkman"
#[[ -s "/Users/chihiro/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/chihiro/.sdkman/bin/sdkman-init.sh"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
