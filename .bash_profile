
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

