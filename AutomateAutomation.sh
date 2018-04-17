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


