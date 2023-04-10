#!/usr/bin/env bash

# Set custom OS X defaults
# See also:
# https://github.com/mathiasbynens/dotfiles
# https://github.com/Wilto/dotfiles/blob/master/bin/osxdefaults

# -----------------------------------------------------------------------------
# SECURITY
# -----------------------------------------------------------------------------

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# -----------------------------------------------------------------------------
# GENERAL
# -----------------------------------------------------------------------------

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Disable the focus ring animation
defaults write -globalDomain NSUseAnimatedFocusRing -bool NO

# -----------------------------------------------------------------------------
# DOCK
# -----------------------------------------------------------------------------

# Show indicator lights for open applications
defaults write com.apple.dock show-process-indicators -bool true

# Use the scale effect for window minimizing
defaults write com.apple.dock mineffect scale


# -----------------------------------------------------------------------------
# FINDER
# -----------------------------------------------------------------------------

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show the ~/Library folder
chflags nohidden ~/Library

# Hide the ~/Public folder
chflags hidden ~/Public

# Hide the ~/Music folder (iTunes manages this folder, look not upon the horrors within)
chflags hidden ~/Music

# Use column view in all windows by default
# Four-letter codes for views modes: `icnv`, `Nlsv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"


# -----------------------------------------------------------------------------
# SHEETS/PANELS
# -----------------------------------------------------------------------------

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# -----------------------------------------------------------------------------
# SCREENSHOTS
# -----------------------------------------------------------------------------

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# -----------------------------------------------------------------------------
# DISKS
# -----------------------------------------------------------------------------

# Don’t create .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable Time Machine prompts when attaching USB media
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true


# -----------------------------------------------------------------------------
# HARDWARE
# -----------------------------------------------------------------------------

# Speed up Magic Mice
# The maximum available in the preference pane is 3.0
defaults write -g com.apple.mouse.scaling 5.0

# Don’t open Photos.app on each new device connection
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool YES

# Set a blazing-fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# -----------------------------------------------------------------------------
# MISC
# -----------------------------------------------------------------------------

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Disable spotlight Dictionary results
defaults write com.apple.spotlight DictionaryLookupEnabled -bool false

# -----------------------------------------------------------------------------
# RESTART ALL THE THINGS
# Restart OS X services after running the script
# -----------------------------------------------------------------------------

for app in "Dashboard" "Dock" "Finder" "SystemUIServer" "Terminal" "iTunes"; do
  killall "$app" > /dev/null 2>&1
done