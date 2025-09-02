# Dev Tools

This document contains infomration on how to setup a new workstation. It assumes Ubuntu.


```sh
# Generate ssh key and accept default location of ~/.ssh/id_ed25519
ssh-keygen -t ed25519 -C "tony.gilkerson@udri.udayton.edu"

# Configure git
git config --global user.name "Tony Gilkerson"
git config --global user.email "tony.gilkerson@udri.udayton.edu"

# Add this to ssh keys in GitHub (settings->ssh keys)
cat ~/.ssh/id_ed25519.pub

# Install homebrew
sudo apt update
sudo apt install build-essential git -y
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# chrome
sudo apt install .
#
# Brew
#
echo Updating Homebrew. This may take a while...
brew update

# We recommend that you install GCC:
brew install gcc

brew install go 
brew install helmfile
brew install kind
brew install kubernetes-cli 
brew install helm
brew install yq
brew install jq
brew install krew || brew upgrade krew
brew install crane
brew install derailed/k9s/k9s
brew install tmux
brew install ffurrer2/tap/semver  
brew install dagger/tap/dagger

brew install --cask google-chrome