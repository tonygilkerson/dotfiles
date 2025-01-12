#!/usr/bin/env bash

# This script is meant to run on any unix variant and MacOS X.
# This scripts does not have any hope of running on Windows.

# set -e
# set -o errexit # quit script if error occurs
# set -o pipefail # quit a pipe if error occurs. 
# set -o nounset # quit if there are unset variables

# check for curl
if ! command -v curl &> /dev/null
then
  echo "curl is required"
  exit 1
fi

# Install Homebrew
if ! command -v brew &> /dev/null
then
  echo "Installing Homebrew"
  /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  # Special setup requirements for linux
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Editing $HOME/.profile to automatically add Homebrew to PATH"
    # check for existence of brew executable using bash's "-f"
    # It could be in two locations depending on the level of access for the user that is installing it. If brew is not
    # installed to either of these directories then there was a problem with the install.
    BREW_PATH=".linuxbrew/bin/brew"
    if [ -f "/home/linuxbrew/$BREW_PATH" ]; then
      # found it in /home/linuxbrew 

      # add some comments to the .profile for the user to read later, and add eval statement
      echo '#######################################################################################################' >> "$HOME/.profile"
      echo '# This section added by act3_tools_install script. Should add Homebrew to path automatically' >> "$HOME/.profile"
      echo '# brew executable was found installed in /home/linuxbrew, so we add it to path' >> "$HOME/.profile"
      echo 'eval "$(/home/linuxbrew/'"$BREW_PATH"' shellenv)"' >> "$HOME/.profile"
      eval "$(/home/linuxbrew/$BREW_PATH shellenv)"
    elif [ -f "$HOME/$BREW_PATH" ]; then
      # brew executable must have been installed in user directory instead of /home/linuxbrew

      # add some comments to the .profile for the user to read later, and add eval statement
      echo '#######################################################################################################' >> "$HOME/.profile"
      echo '# This section added by act3_tools_install script. Should add Homebrew to path automatically' >> "$HOME/.profile"
      echo '# brew executable not found in /home/linuxbrew, so we assume it is in user dir and add it to the path' >> "$HOME/.profile"
      echo "adding eval statement of $HOME/$BREW_PATH to $HOME/.profile"
      echo 'eval "$('"$HOME/$BREW_PATH"' shellenv)"' >> "$HOME/.profile"
      eval "$($HOME/$BREW_PATH shellenv)"
    else
      echo "ERROR: Brew executable not found in any of the expected locations! Looked in /home/linuxbrew/$BREW_PATH and $HOME/$BREW_PATH"
      echo "quitting tools installation script."
      exit 1
    fi

    # add some more comments to the .profile
    echo '# end of section added by act3_tools_install for Homebrew' >> "$HOME/.profile"
    echo '#############################################################################################' >> "$HOME/.profile"
  fi
fi


echo Updating Homebrew. This may take a while...
brew update

# I assume if on the mac you are using the default zsh and completion is already installed
echo Setting up Bash completion file and folder...
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  brew install bash-completion
fi

# # If os=linux then install awscli via apt-get to avoid bloat
# #  when awscli is installed via homebrew it pulls in alot of 
# #  unneeded dependencies causing the image to be bloated
# echo OSTYPE is [$OSTYPE]
# if [[ "$OSTYPE" == "linux-gnu"* ]]; then
#   echo Installing awscli using apt-get...
#   apt-get update && apt-get -y install awscli 

# else
#   echo Installing awscli using brew...
#   brew install awscli || brew upgrade awscli
# fi

echo Installing tools with brew...
# Homebrew installs to `brew --prefix` by default
brew install go || brew upgrade go
brew install helmfile || brew upgrade helmfile
brew install kind || brew upgrade kind
brew install kubernetes-cli || brew upgrade kubernetes-cli
brew install helm || brew upgrade helm
# brew install skaffold || brew upgrade skaffold
# brew install container-structure-test || brew upgrade container-structure-test
# brew install rancher-cli || brew upgrade rancher-cli
# brew install minio-mc || brew upgrade minio-mc
brew install yq || brew upgrade yq
brew install jq || brew upgrade jq
# brew install sops || brew upgrade sops
brew install krew || brew upgrade krew
# brew install parallel || brew upgrade parallel
# brew install kustomize || brew upgrade kustomize
# brew install int128/kauthproxy/kauthproxy || brew upgrade int128/kauthproxy/kauthproxy
# brew install int128/kubelogin/kubelogin || brew upgrade int128/kubelogin/kubelogin
brew install crane || brew upgrade crane
brew install derailed/k9s/k9s || brew upgrade derailed/k9s/k9s
brew install tmux || brew upgrade tmux
brew install ffurrer2/tap/semver  

# # AltTab
# # This app make the Mac act like windows so when I alt+tab to a minimized window it will open it.
# # see: https://alt-tab-macos.netlify.app/
# brew install --cask alt-tab 

echo Installing Krew plugins...
kubectl krew update
kubectl krew install ctx
kubectl krew install ns
kubectl krew install view-allocations
kubectl krew install view-secret
kubectl krew install konfig
kubectl krew upgrade

echo Installing helm plugins...
helm_plugins=$(helm plugin list | cut -f1 | grep -v NAME)
echo $helm_plugins | grep secrets || helm plugin install https://github.com/jkroepke/helm-secrets
echo $helm_plugins | grep push || helm plugin install https://github.com/chartmuseum/helm-push
echo $helm_plugins | grep helm-git || helm plugin install https://github.com/aslafy-z/helm-git
echo $helm_plugins | grep diff || helm plugin install https://github.com/databus23/helm-diff
echo $helm_plugins | grep s3 || helm plugin install https://github.com/hypnoglow/helm-s3.git
#echo $helm_plugins | grep x || helm plugin install https://github.com/mumoshu/helm-x


# chrome
brew install --cask google-chrome

cat << EOF

!! YOU ARE NOT DONE YET !!

Copy and paste the below in your Terminal:

Ubuntu:
  echo 'export PATH=${KREW_ROOT:-$HOME/.krew}/bin:\$PATH' >> ~/.bashrc
  echo '[[ -r "/home/linuxbrew/.linuxbrew/etc/profile.d/bash_completion.sh" ]] && . "/home/linuxbrew/.linuxbrew/etc/profile.d/bash_completion.sh"' >> ~/.bashrc

MacOS:
  echo 'export PATH=${KREW_ROOT:-$HOME/.krew}/bin:\$PATH' >> /etc/bashrc
  echo '[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"' >> /etc/bashrc

This script has edited ~/.profile to add brew to the PATH.
On Ubuntu, this means that anything installed with brew (e.g. kubectl) will not work until you LOG OUT AND BACK IN.

If you are running MacOS, Homebrew took care of this for you, so logging out is unnecessary, but you should restart your Terminal.

To update to the newest stable version of tools installed by Homebrew, run:
  brew upgrade
  kubectl krew upgrade

To install podman
  mac:
    brew install podman
  linux:
    sudo apt-get -y install podman
    # Then...
    # Create this file "/etc/systemd/system/user@.service.d/delegate.conf" add the folloiwng
    #  [Service]
    #  Delegate=yes
    #
    # Then "sudo systemctl daemon-reload"
    # see: https://kind.sigs.k8s.io/docs/user/rootless/

EOF

