#!/bin/bash
#
# Set up OSX preferences
#
# Inspired by: https://github.com/mathiasbynens/dotfiles/blob/master/.osx
###########################################
# CONFIG

HOSTNAME="darwin"

###########################################
# MAIN

echo "This script will set properties on OSX"

echo " Ask for the administrator password for the duration of this script"
sudo -v

echo " Keep-alive: update existing sudo time stamp until .osx has finished"
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo " Set computer name to $HOSTNAME (as done via System Preferences → Sharing)"
sudo scutil --set ComputerName $HOSTNAME
sudo scutil --set HostName $HOSTNAME
sudo scutil --set LocalHostName $HOSTNAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $HOSTNAME

echo " Finder: show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true

echo " Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo " Finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo " Enable snap-to-grid for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

echo " Use list view in all Finder windows by default"
# Four-letter codes for the other view modes: icnv, clmv, Flwv"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
echo " Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

echo " Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

#disable Gatekeeper
sudo spctl --master-disable

#enable Tab in modal dialogs
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

#Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo " Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

#Show IP address, hostname, OS version when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

#Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Run a brew update
brew update

#Install Cask (Cask is now bundled with Homebrew
#brew install cask

#Clone full brew repo
git -C "$(brew --repo homebrew/core)" fetch --unshallow

brew install ansible
brew install --cask google-chrome
brew install node
brew cask install minikube
brew install p7zip
brew install caskroom/cask/virtualboX
brew install htop
brew cask install visual-studio-code
open /Applications/Visual\ Studio\ Code.app/
brew cask install powershell
brew cask install slack
open /Applications/Slack.app
brew cask install iterm2
open /Applications/iTerm.app
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash
brew cask install tunnelblick
brew cask install filezilla
brew cask install bettertouchtool
open /Applications/BetterTouchTool.app
brew install bitwarden
brew install git

#Install oh-man-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Install mas (Mac Apple Store CLI)
brew install mas

#Install Docker
brew cask install docker
brew install bash-completion
brew install docker-completion
brew install docker-compose-completion
brew install docker-machine-completion
sudo open /Applications/Docker.app/
brew install ctags

#Change Theme to Dark
sudo defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark

#Change Wallpaper to Solid Gray Pro Ultra Dark
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Library/Desktop Pictures/Solid Colors/Solid Gray Pro Ultra Dark.png"'

#Install and Enable Dark Mode
brew install dark-mode
dark-mode

#Reduce Transparency
defaults write com.apple.universalaccess reduceTransparency -bool

#Show battery percentage
currentUser=`ls -l /dev/console | cut -d " " -f4`
sudo -u $currentUser defaults write com.apple.menuextra.battery ShowPercent YES
sudo -u $currentUser killall SystemUIServer

#Suck Animation
defaults write com.apple.dock mineffect suck; killall Dock

#Clean up Dock (Only show Open Applications)
defaults write com.apple.dock static-only -bool TRUE; killall Dock

##Kill Animations
# opening and closing windows and popovers
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# smooth scrolling
defaults write -g NSScrollAnimationEnabled -bool false

# showing and hiding sheets, resizing preference windows, zooming windows
# float 0 doesn't work
defaults write -g NSWindowResizeTime -float 0.001

# opening and closing Quick Look windows
defaults write -g QLPanelAnimationDuration -float 0

# rubberband scrolling (doesn't affect web views)
defaults write -g NSScrollViewRubberbanding -bool false

# resizing windows before and after showing the version browser
# also disabled by NSWindowResizeTime -float 0.001
defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false

# showing a toolbar or menu bar in full screen
defaults write -g NSToolbarFullScreenAnimationDuration -float 0

# scrolling column views
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0

# showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0

# showing and hiding Mission Control, command+numbers
defaults write com.apple.dock expose-animation-duration -float 0

# showing and hiding Launchpad
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock springboard-hide-duration -float 0

# changing pages in Launchpad
defaults write com.apple.dock springboard-page-duration -float 0

# at least AnimateInfoPanes
defaults write com.apple.finder DisableAllAnimations -bool true

# sending messages and opening windows for replies
defaults write com.apple.Mail DisableSendAnimations -bool true
defaults write com.apple.Mail DisableReplyAnimations -bool true

