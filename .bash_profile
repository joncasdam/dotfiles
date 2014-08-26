
alias l="ls -a"
alias ls="ls -G"
alias la="ls -AF"
alias reload="source ~/.bash_profile"
alias ht='cd /Applications/MAMP/htdocs/'
alias tailf='tail -f'

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

#----------------------
# function to start and
# go to project folder
#----------------------
function work() {
    typeset env_name="$1"
    typeset env_folder="$2"
    if [ "$env_name" = "" ]
    then
        virtualenvwrapper_show_workon_options
        return 1
    fi
    if [ "$env_folder" = "" ]
    then
        echo "Indique a pasta do projeto"
        return 1
    fi

    virtualenvwrapper_verify_workon_environment $env_name || return 1
    cd /Users/jonatascd/www/$env_folder
    echo "Trabalhando em: $env_name"
    echo -n -e "\033]0;$env_name\007"
}

export PATH
