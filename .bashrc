# alias
alias 'll'='ls -al'
alias 'be'='bundle exec'
alias 'dcx'='docker-compose exec'
alias 'ssh-peco'='ssh $(grep -w Host ~/.ssh/config | awk '\''{print $2}'\'' | peco )'

# history
export HISTSIZE=2000
export HISTFILESIZE=2000
export HISTCONTROL=ignoreboth
export HISTIGNORE=ls:ll:exit:cd:

export PATH="$PATH:~/flutter/bin"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export PATH="/usr/local/sbin:$HOME/Library/Android/sdk/platform-tools/:$PATH"

if [ -f /usr/local/etc/brew-wrap ];then
	
source /usr/local/etc/brew-wrap
fi

export EDITOR=$(which vim)
source ~/.bin/tmuxinator.bash

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# esp32
export PATH=$PATH:$HOME/esp32/xtensa-esp32-elf/bin
export IDF_PATH=$HOME/esp32/esp-idf

export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

export PATH="usr/local/opt/mysql@5.6/bin:$PATH"

# aws
export "PATH=~/aws/bin:$PATH"

export THOR_MERGE=mergetool_for_rails_generator

export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="/usr/local/opt/mongodb-community@3.4/bin:$PATH"

# jEnv
#export JENV_ROOT="$HOME/.jenv"
#if [ -d "${JENV_ROOT}" ]; then
#  export PATH="$JENV_ROOT/bin:$PATH"
#  eval "$(jenv init -)"
#fi

export JAVA_HOME=`/usr/libexec/java_home -v 14`

alias j14="export JAVA_HOME=`/usr/libexec/java_home -v 14`; java -version"
alias j13="export JAVA_HOME=`/usr/libexec/java_home -v 13`; java -version"
alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version"

# ebeaninit
export PATH="$PATH:~/.local/bin"

# peco

export HISTSIZE=10000
export HISTCONTROL=ignoredups
export HISTIGNORE="fg:bg:history*:cd:ls:exit:pwd"

peco-history() {
  local NUM=$(history | wc -l)
  local FIRST=$((-1*(NUM-1)))

  if [ $FIRST -eq 0 -a $HISTCMD -ge 2 ] ; then
    # Remove the last entry, "peco-history"
    history -d $((HISTCMD-1))
    echo "No history" >&2
    return
  fi

  local CMD=$(fc -l $FIRST | sort -k 2 -k 1nr | uniq -f 1 | sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)

  if [ -n "$CMD" ] ; then
    # Replace the last entry, "peco-history", with $CMD
    history -s $CMD

    if type osascript > /dev/null 2>&1 ; then
      # Send UP keystroke to console
      (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
    fi

    # Uncomment below to execute it here directly
    # echo $CMD >&2
    # eval $CMD
  elif [ $HISTCMD -ge 2 ]; then
    # Remove the last entry, "peco-history"
    history -d $((HISTCMD-1))
  fi
}
bind -x '"\C-r":peco-history'
