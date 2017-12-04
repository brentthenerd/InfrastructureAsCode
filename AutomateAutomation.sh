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

#Install mas (Mac Apple Store CLI)
brew install mas

#Install OneDrive
mas install 823766827
