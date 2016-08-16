
alias ..="cd .."
alias gst="git status"
alias gdf="git diff"
alias lasttag="git describe --abbrev=0 --tags"
alias l="ls -a"
alias ls="ls -G"
alias la="ls -AF"
alias reload="source ~/.bash_profile"
alias ht="cd /Applications/MAMP/htdocs/"
alias tailf="tail -f"
alias cleanpyc="find . -name \*.pyc -delete"

export LSCOLORS='Gxfxcxdxdxegedabagacad'

if [ $(uname) = "Linux" ]
then
    alias ls="ls --color=always"
fi

alias q="exit"
alias ..="cd .."
alias gst="git status"
alias gdf="git diff"
alias lasttag="git describe --abbrev=0 --tags"
alias manage='python ./manage.py'
alias ascp='/Users/jonatascd/Applications/Aspera\ Connect.app/Contents/Resources/ascp'

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;30;40'

export PATH=/Users/jonatascd/bin:$PATH

export PATH

##################
# docker alias
##################
alias doma='docker-machine'
alias doco='docker-compose'

##################
# docker functions
##################

function domaenv {
    DOCKER_MACHINE=${1:-"default"}
    eval $(docker-machine env ${DOCKER_MACHINE}) && echo "Docker environment '${DOCKER_MACHINE}' loaded" || echo "Failed to load docker environment '${DOCKER_MACHINE}'"
}

function vmhigh {
    DOCKER_MACHINE=${1:-"default"}
    cleanpyc
    doma stop ${DOCKER_MACHINE}
    VBoxManage modifyvm ${DOCKER_MACHINE} --memory 5120 && echo "Virtual Machine ${DOCKER_MACHINE}'s memory set to 5120MB."
    VBoxManage modifyvm ${DOCKER_MACHINE} --cpuexecutioncap 90 && echo "Virtual Machine ${DOCKER_MACHINE}'s CPU limit set to 90%."
    doma start ${DOCKER_MACHINE}
    domaenv ${DOCKER_MACHINE}
}

function vmlow {
    DOCKER_MACHINE=${1:-"default"}
    cleanpyc
    doma stop ${DOCKER_MACHINE}
    VBoxManage modifyvm ${DOCKER_MACHINE} --memory 3072 && echo "Virtual Machine ${DOCKER_MACHINE}'s memory set to 3072MB"
    VBoxManage modifyvm ${DOCKER_MACHINE} --cpuexecutioncap 60 && echo "Virtual Machine ${DOCKER_MACHINE}'s CPU limit set to 60%"
    doma start ${DOCKER_MACHINE}
    domaenv ${DOCKER_MACHINE}
}

function dockrmi {
    if [ "$1" = "--dry" ]; then
        docker images -q -f dangling=true
    else
        docker rmi -f $(docker images -q -f dangling=true)
    fi
}

function dockrmvol {
    if [ "$1" = "--dry" ]; then
        docker volume ls -qf dangling=true
    else
        docker volume rm $(docker volume ls -qf dangling=true)
    fi
}

function dockrmall {
    if [ "$1" = "--dry" ]; then
        docker ps -a -q -f status=exited
    else
        docker rm -f -v $(docker ps -a -q -f status=exited)
    fi
}

