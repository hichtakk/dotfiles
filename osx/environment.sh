#!/bin/sh

# Finder
## Prohibit making .DS_Store file on network volume
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
killall Finder

# Dock
defaults write com.apple.dock tilesize -int 25
defaults write com.apple.dock orientation -string "left"
killall Dock

# Keyboard

## Disable Spotlight
#defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "{enabled = 0; value = { parameters = (65535, 49, 1048576); type = 'standard'; }; }"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "<dict><key>enabled</key><false/></dict>"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 65 "<dict><key>enabled</key><false/></dict>"

