#!/usr/bin/env bash

set -x 

#
# Put in path so "source load-k8s-config.sh" can be added in the .bashrc
#
install kubeconf/load-k8s-config.sh /usr/local/bin/
install kubeconf/load-k8s-config.md $HOME/.kube/

install .my-ps1 ~/
install .my-bashrc ~/
install .bashrc ~/
echo ". ~/.bashrc" > ~/.bash_profile

echo "Done! - to use 'source ~/.bashrc'"