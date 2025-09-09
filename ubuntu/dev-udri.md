# Ubuntu Dev Setup

This document contains infomration on how to setup a new workstation. It assumes Ubuntu.

See install instruction for [ghostty](https://ghostty.org/docs/install/binary)

```sh
# Generate ssh key and accept default location of ~/.ssh/id_ed25519

# For DLE you must use ecdsa 
# ssh-keygen -t ed25519 -C "tony.gilkerson@udri.udayton.edu"
ssh-keygen -t ecdsa -b 384 -C "tony.gilkerson@udri.udayton.edu act3 laptop"
chmod 600 ~/.ssh/id_ed25519
chmod 700 ~/.ssh
ssh -vT git@gitlab.dle.afrl.af.mil

# Configure git
git config --global user.name "Tony Gilkerson"
git config --global user.email "tony.gilkerson@udri.udayton.edu"

# Add this to ssh keys in GitHub (settings->ssh keys)
# cat ~/.ssh/id_ed25519.pub
cat ~/.ssh/id_ecdsa.pub

#
# apt
#
sudo apt update
sudo apt install tree
sudo apt install gnome-tweak-tool
sudo apt install podman
#
# Steps to install gcloud on Ubuntu:
#
sudo apt install apt-transport-https ca-certificates gnupg
sudo apt install ca-certificates gnupg
# immport the Google Cloud public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
# Add the Google Cloud SDK source to your apt sources list:
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt update && sudo apt install google-cloud-cli
gcloud init

#
# Install docker
#
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's GPG Key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add Docker Repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# This allows you to run Docker commands without sudo.
sudo usermod -aG docker $USER
newgrp docker

# Verify
docker run hello-world


#
# Install homebrew
#
sudo apt update
sudo apt install build-essential git -y
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


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

```

For Chrome on Ubuntu

```sh
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
```

## VS Code

Customize keybindings in VS Code

* Open the Command Palette in VS Code by pressing Ctrl+Shift+P.
* Type Open Keyboard Shortcuts (JSON) and select the corresponding option. This will open your keybindings.json file in the editor.
* Add the following keybinding rules to the list in the keybindings.json file. This is the most effective solution, as it allows for context-sensitive behavior.

```json
// Place your key bindings in this file to override the defaults.
[
    {
        "key": "ctrl+c",
        "command": "workbench.action.terminal.copySelection",
        "when": "terminalFocus && terminalTextSelected"
    },
    {
        "key": "ctrl+c",
        "command": "workbench.action.terminal.sendSequence",
        "args": {
            "text": "\u0003"
        },
        "when": "terminalFocus && !terminalTextSelected"
    },
    {
        "key": "ctrl+v",
        "command": "workbench.action.terminal.paste",
        "when": "terminalFocus"
    }
]
```