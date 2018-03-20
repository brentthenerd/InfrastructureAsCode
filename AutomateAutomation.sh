#!/bin/bash

#Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Run a brew update
brew update

#Install Cask (Cask is now bundled with Homebrew
#brew install cask

#Install Visual Studio Code
brew cask install visual-studio-code

#Install Powershell
brew cask install powershell

#Install Chrome
brew cask install google-chrome

#Install Slack
brew cask install slack

#Install iTerm2
brew cask install iterm2

#Install Tunnel Blick
brew cask install tunnelblick

#Install Filezilla
brew cask install filezilla

#Install mas (Mac Apple Store CLI)
brew install mas

#Install OneDrive
mas install 823766827

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

#Change Wallpaper to Solid Gray
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Library/Desktop Pictures/Solid Colors/Solid Gray Dark.png"'
