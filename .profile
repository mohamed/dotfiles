#export PS1='($?)[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]][\[\033[01;33m\]\D{%F %T}\[\033[00m\]] > '
#export PS1='($?)\[\e[32m\]\u@\h\[\e[0m\]:\[\e[36m\]\w\[\e[0m\] # '
# Use $ for normal users. # for root
green=$(tput setaf 2)
blue=$(tput setaf 4)
bold=$(tput bold)
reset=$(tput sgr0)
export PS1="\[$green$bold\]\u@\h\[$reset\]:\[$blue$bold\]\w\[$reset\] \$ "
