#!/usr/bin/env bash
# exit when any command fails
set -e
# set -x			# activate debugging from here
# set +x			# stop debugging from here

#
# Use the default  ~/.kube/config, it will import that too and all the contexts
#
export KUBECONFIG="$HOME/.kube/config"

#
# Your additional kubeconfig files should be inside ~/.kube/config-files
#
ADD_KUBECONFIG_FILES="$HOME/.kube/config-files"
mkdir -p "${ADD_KUBECONFIG_FILES}"
OIFS="$IFS"
IFS=$'\n'
for kubeconfigFile in $(find "${ADD_KUBECONFIG_FILES}" -type f -name "*.yml" -o -name "*.yaml")
do
  echo "Add: $kubeconfigFile"
  export KUBECONFIG="$kubeconfigFile:$KUBECONFIG"
done
IFS="$OIFS"

#
# Merg them all into one and use the one
#
cp "$HOME/.kube/config" "$HOME/.kube/config-$(date '+%Y-%m-%d-%H:%M:%S')"
kubectl config view --flatten > "$HOME/.kube/merged-config" && mv "$HOME/.kube/merged-config" "$HOME/.kube/config"
export KUBECONFIG="$HOME/.kube/config"

chmod o-r "$HOME/.kube/config"
chmod g-r "$HOME/.kube/config"
