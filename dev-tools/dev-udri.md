# Dev Tools

This document contains infomration on how to setup a new workstation. It assumes Ubuntu.


```sh
# Install homebrew
su  do apt update
sudo apt install build-essential git -y
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Generate ssh key and accept default location of ~/.ssh/id_ed25519
ssh-keygen -t ed25519 -C "tony.gilkerson@udri.udayton.edu"

# Configure git
git config --global user.name "Tony Gilkerson"
git config --global user.email "tony.gilkerson@udri.udayton.edu"

# Add this to ssh keys in GitHub (settings->ssh keys)
cat ~/.ssh/id_ed25519.pub



brew install yq 
brew install dagger/tap/dagger
brew install helm

