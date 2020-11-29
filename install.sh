#!/bin/bash

set -eu

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "start setup..."
for f in .??*; do
    [ "$f" = ".gitignore" ] && continue
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".DS_Store" ] && continue

    ln -snfv ~/dotfiles/"$f" ~/
done

[ -e ~/.gitconfig.local ] || cp ~/dotfiles/.gitconfig.local.template ~/.gitconfig.local


# bashrc
cp .bashrc ~/.bashrc
source ~/.bashrc 


# installers

./installers/homebrew.sh

# rbenv
RUBYS=(2.0.0-p481 2.3.6 2.4.0 2.4.2 2.5.3 2.6.3 2.6.5)
for item in ${RUBYS[@]}; do
  rbenv install $item
done

# nodebrew
NODES=(v5.10.0 v6.1.0 v6.9.5 v6.15.0 v12.3.1 v12.11.1 v12.12.0 v13.9.0 )
for item in ${NODES[@]}; do
  nodebrew use $item
done

# python系
PYTHONS=(3.7.0)
for item in ${PYTHONS[@]}; do
  pyenv install $item
done

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END