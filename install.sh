#!/bin/bash

# set -x 

#
# Create a .bashrc file and start by adding
# common stuff
#
cat ps1-k8s > .temp/.bashrc
cat bashrc-common >> .temp/.bashrc

#
# Add stuff that is os specific
#
UNAME=$(uname)

if [ "$UNAME" == "Linux" ] ; then
	echo "Running on Linux"
    cat bashrc-linux-samson >> .temp/.bashrc

elif [ "$UNAME" == "Darwin" ] ; then
	echo "Running on Darwin"
    cat bashrc-mac-m2 >> .temp/.bashrc

fi

#
# Put md in home so they can manually load-k8s-config.sh when needed
#
install kubeconf/load-k8s-config.md $HOME/.kube/
install kubeconf/load-k8s-config.sh $HOME/.kube/

#
# Install .bashrc and force .bash_profile to use it
#
install  .temp/.bashrc ~/
echo ". ~/.bashrc" > ~/.bash_profile


echo "Done! - to use 'source ~/.bashrc'"