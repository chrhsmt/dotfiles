#!/bin/bash

set -eu

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
curl -L git.io/nodebrew | perl - setup
export PATH=$HOME/.nodebrew/current/bin:$PATH
NODES=(v5.10.0 v6.1.0 v6.9.5 v6.15.0 v12.3.1 v12.11.1 v12.12.0 v13.9.0 )
for item in ${NODES[@]}; do
  nodebrew install $item
done

# python系
echo "setup python"
#PYTHONS=(3.7.0)
#for item in ${PYTHONS[@]}; do
#  pyenv install $item
#done

# 時計アイコンクリック時にOSやホスト名ipを表示する
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Bluetoothヘッドフォン/ヘッドセットの音質を向上させる
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# デフォルトで隠しファイルを表示する
defaults write com.apple.finder AppleShowAllFiles -bool true

# ステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true

# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true

# 拡張子変更時の警告を無効化
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# 全ての拡張子のファイルを表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# USBやネットワークストレージに.DS_Storeファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# 検索クエリをAppleへ送信しない
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# アドレスバーに表示されるURLを全表示
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# ファイルのダウンロード後に自動でファイルを開くのを無効化
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# 追跡を無効化
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# ターミナル終了時のプロンプトを非表示にする
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Dockで開いているアプリケーションのインジケータライトを表示する
defaults write com.apple.dock show-process-indicators -bool true

# 開いているアプリケーションのみをdockに表示
defaults write com.apple.dock static-only -bool true

# アプリケーション起動時のアニメーションを無効化
defaults write com.apple.dock launchanim -bool false

# すべての（デフォルトの）アプリアイコンをDockから消去する
defaults write com.apple.dock persistent-apps -array

# 自動で
defaults write com.apple.dock autohide -bool true

# ゴミ箱を空にする前の警告の無効化
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# メインディスクのインデックスの有効化
sudo mdutil -i on / > /dev/null

# インデックスの再構築
sudo mdutil -E / > /dev/null

# tabキーでWebページの項目の強調
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# Safariのデバッグメニューを有効化
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# 自動修正の無効化
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

# ステータスバー
defaults write com.apple.Safari ShowStatusBar -boolean YES

# UTF-8のみを使用する
defaults write com.apple.terminal StringEncodings -array 4

# WebKitデベロッパーツールを有効にする
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# デバッグメニューを有効にする
defaults write com.apple.appstore ShowDebugMenu -bool true

# 自動更新チェックを有効にする
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# 毎日アプリケーションのアップデートを確認する
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# AUDIO MIDI 設定でスピーカーを96Khzにする
/usr/libexec/PlistBuddy -c "set BuiltInSpeakerDevice:'output streams':0:'sample rate' 96000.000000" /Library/Preferences/Audio/com.apple.audio.DeviceSettings.plist

# iPhone接続時にPhotosが自動で開くのをやめる
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# TimeMachineのCPUプライオリティを上げる
sudo sysctl debug.lowpri_throttle_enabled=0

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# show column view as default
defaults write com.apple.Finder FXPreferredViewStyle -string "clmv"

# Allow text selection in Quick Look/Preview
defaults write com.apple.finder QLEnableTextSelection -bool true

# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Enabling the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

# Adding a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true


# disable guest user
sudo defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool false
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool false

# show remaining battery time
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Set home as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# Top left screen corner → Mission Control
# defaults write com.apple.dock wvous-tl-corner -int 2
# defaults write com.apple.dock wvous-tl-modifier -int 0
# # Top right screen corner → Desktop
# defaults write com.apple.dock wvous-tr-corner -int 4
# defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Start screen saver
# defaults write com.apple.dock wvous-bl-corner -int 5
# defaults write com.apple.dock wvous-bl-modifier -int 0

# Bottom left screen corner → Desktop
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifier -int 0

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Press Tab to highlight each item on a web page
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Enable “Do Not Track”	
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true
# Only use UTF-8 in Terminal.app	
defaults write com.apple.terminal StringEncodings -array 4

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
