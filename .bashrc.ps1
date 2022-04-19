
build_ps1() {
    local readonly bold="\[$(tput bold)\]"
    local readonly gray="245"
    local readonly blue="\e[0;34m"
    local readonly cyan="\e[0;36m"
    local readonly yellow="\e[0;33m"
    local readonly ltPurple="\e[0;35m"
    local readonly gray="\e[1;30m"
    local readonly endColor="\e[m"

    # local readonly directory='\w'
    local readonly directory="$(pwd | sed "s|^$HOME|~|")"
    local readonly host='\h'
    local readonly user='\u'
    local readonly cluster="$(kubectl config current-context)"
    local readonly namespace="$(kubectl config view | kx="$(kubectl config current-context)" yq '.contexts[] | select(.context.cluster ==env(kx)) | select(.context.namespace != null) | .context.namespace' -)"

    local prompt=''

    # prompt="${user}@"
    # prompt="${prompt}${bold}$(colorize ${host}):"
    # prompt="${prompt}$(colorize $directory $gray)"
    # prompt="${prompt}${term_reset}"
    
    prompt="(${startColor}${blue}${cluster}${endColor}:${yellow}${namespace}${endColor}) ${ltGray}${directory}${endColor}$ "

    # echo -n "${prompt}"
    PS1="${prompt}"

}

# export PS1='$(build_ps1)'
export PROMPT_COMMAND=build_ps1
