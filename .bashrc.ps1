#!/bin/bash

build_ps1() 
{
    # local bold="\[$(tput bold)\]"
    # local cyan="\[\e[0;36m\]"
    # local  gray="\[\e[1;30m"
    local ltPurple="\[\e[0;35m"
    local  blue="\[\e[0;34m\]"
    local  yellow="\[\e[0;33m\]"
    local  endColor="\e[0m\]"

    # local  directory='\w'
    # local readonly host='\h'
    # local readonly user='\u'
    local  namespace
    local  directory
    local  cluster

    directory=$(pwd | sed "s|^$HOME|~|")
    namespace="$(kubectl config view | kx="$(kubectl config current-context)" yq '.contexts[] | select(.context.cluster ==env(kx)) | select(.context.namespace != null) | .context.namespace' -)"
    cluster="$(kubectl config current-context)"

    local prompt=""

    # prompt="${user}@"
    # prompt="${prompt}${bold}$(colorize ${host}):"
    # prompt="${prompt}$(colorize $directory $gray)"
    # prompt="${prompt}${term_reset}"
    
    # prompt="(${blue}${cluster}${endColor}:${yellow}${namespace}${endColor}) ${ltPurple}${directory}${endColor}$ "
    prompt="(${cluster}:${namespace}) ${directory}$ "

    # echo -n "${prompt}"
    PS1="${prompt}"

}

# export PS1='$(build_ps1)'
export PROMPT_COMMAND=build_ps1
