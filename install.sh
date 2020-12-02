#!/bin/bash

set -eu

echo "start setup..."

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

# installers
# setup HomeBrew
echo "setup homebrew"
./installers/homebrew.sh

# restore via mackfile
if [ ! -e "~/.mackup.cfg" ]; then
  echo 'Setup Mackup'
  cat <<EOF > ~/.mackup.cfg
[storage]
engine = icloud
[applications_to_ignore]
ssh
EOF
fi
cd $HOME
mackup restore -f

# rbenv
echo "setup ruby"
RUBYS=(2.0.0-p481 2.3.6 2.4.0 2.4.2 2.5.3 2.6.3 2.6.5)
for item in ${RUBYS[@]}; do
  rbenv install $item
done

# nodebrew
echo "setup node"
NODES=(v5.10.0 v6.1.0 v6.9.5 v6.15.0 v12.3.1 v12.11.1 v12.12.0 v13.9.0 )
for item in ${NODES[@]}; do
  nodebrew use $item
done

# python系
echo "setup python"
PYTHONS=(3.7.0)
for item in ${PYTHONS[@]}; do
  pyenv install $item
done

# 時計アイコンクリック時にOSやホスト名ipを表示する
$ sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Bluetoothヘッドフォン/ヘッドセットの音質を向上させる
$ defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# デフォルトで隠しファイルを表示する
$ defaults write com.apple.finder AppleShowAllFiles -bool true

# 全ての拡張子のファイルを表示
$ defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# USBやネットワークストレージに.DS_Storeファイルを作成しない
$ defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
$ defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show the ~/Library folder
$ chflags nohidden ~/Library

# 検索クエリをAppleへ送信しない
$ defaults write com.apple.Safari UniversalSearchEnabled -bool false
$ defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# アドレスバーに表示されるURLを全表示
$ defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# ファイルのダウンロード後に自動でファイルを開くのを無効化
$ defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# 追跡を無効化
$ defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# ターミナル終了時のプロンプトを非表示にする
$ defaults write com.googlecode.iterm2 PromptOnQuit -bool false

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END