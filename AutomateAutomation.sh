#!/bin/bash

#disable Gatekeeper
sudo spctl --master-disable

#Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Run a brew update
brew update

#Install Cask (Cask is now bundled with Homebrew
#brew install cask

#Clone full brew repo
git -C "$(brew --repo homebrew/core)" fetch --unshallow

#Install Ansible
brew install ansible

#Install Node
brew install node

#Install minikube
brew cask install minikube

#Install p7zip
brew install p7zip

#Install virtualbox
brew install caskroom/cask/virtualboX

#Install htop
brew install htop

#Install Visual Studio Code
brew cask install visual-studio-code
open /Applications/Visual\ Studio\ Code.app/

#Install Powershell
brew cask install powershell

#Install Chrome
brew cask install google-chrome

#Install Slack
brew cask install slack
open /Applications/Slack.app

#Install iTerm2
brew cask install iterm2
open /Applications/iTerm.app
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash

#Install Tunnel Blick
brew cask install tunnelblick

#Install Filezilla
brew cask install filezilla

#Install BetterTouchTool
brew cask install bettertouchtool
open /Applications/BetterTouchTool.app

#Install mas (Mac Apple Store CLI)
brew install mas

#Install OneDrive
mas install 823766827
open /Applications/OneDrive.app

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

